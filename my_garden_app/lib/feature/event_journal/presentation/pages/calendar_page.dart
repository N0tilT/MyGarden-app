import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/constant_values/routes.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/core/presentation/label/garden_default_label_widget.dart';
import 'package:my_garden_app/feature/auth/presentation/bloc/cubit/token_cubit.dart';
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';
import 'package:my_garden_app/feature/event_journal/presentation/bloc/cubit/event_cubit.dart';
import 'package:my_garden_app/feature/event_journal/presentation/widgets/event_bottom_sheet_widget.dart';
import 'package:my_garden_app/feature/event_journal/presentation/widgets/event_list_widget.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_list/plant_list_cubit.dart';
import 'package:my_garden_app/injection_container.dart';

enum CalendarViewType { month, week, day, list }

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarViewType _currentViewType = CalendarViewType.week;

  void _switchViewType(CalendarViewType type) {
    setState(() {
      _currentViewType = type;
    });
  }

  Widget _buildViewTypeTile(
    BuildContext context,
    String title,
    IconData icon,
    CalendarViewType type,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        _switchViewType(type);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EventCubit>(
          create: (context) => sl<EventCubit>()..load(),
        ),
        BlocProvider<TokenCubit>(
          create: (context) => sl<TokenCubit>()..getToken(),
        ),
        BlocProvider<PlantListCubit>(
          create: (context) => sl<PlantListCubit>()..load(),
        ),
      ],
      child: Scaffold(
        appBar: const CalendarAppBarWidget(),
        body: _CalendarWidget(currentViewType: _currentViewType),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'view_switch',
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildViewTypeTile(
                      context,
                      'Месяц',
                      Icons.calendar_month,
                      CalendarViewType.month,
                    ),
                    _buildViewTypeTile(
                      context,
                      'Неделя',
                      Icons.calendar_view_week,
                      CalendarViewType.week,
                    ),
                    _buildViewTypeTile(
                      context,
                      'День',
                      Icons.calendar_today,
                      CalendarViewType.day,
                    ),
                    _buildViewTypeTile(
                      context,
                      'Список',
                      Icons.list,
                      CalendarViewType.list,
                    ),
                  ],
                ),
              ),
              child: const Icon(Icons.switch_left),
            ),
            const SizedBox(
              height: 20,
            ),
            Builder(
              builder: (parentContext) {
                return FloatingActionButton(
                  heroTag: 'add_event',
                  onPressed: () {
                    showModalBottomSheet(
                      context: parentContext,
                      isScrollControlled: true,
                      builder: (modal) => MultiBlocProvider(
                        providers: [
                          BlocProvider.value(
                            value: BlocProvider.of<TokenCubit>(parentContext),
                          ),
                          BlocProvider.value(
                            value: BlocProvider.of<EventCubit>(parentContext),
                          ),
                          BlocProvider.value(
                            value:
                                BlocProvider.of<PlantListCubit>(parentContext),
                          ),
                        ],
                        child: EventCardBottomSheet(
                          event: EventEntity(
                            id: null,
                            title: "",
                            plantId: 0,
                            date: DateTime.now(),
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CalendarWidget extends StatelessWidget {
  final CalendarViewType currentViewType;
  const _CalendarWidget({required this.currentViewType});

  @override
  Widget build(BuildContext context) {
    final eventCubit = context.watch<EventCubit>();
    return context.watch<TokenCubit>().state.when(
          initial: () {
            return const Center(child: GardenLoadingWidget());
          },
          authorized: (token) {
            return const Center(child: GardenLoadingWidget());
          },
          fail: (l) {
            Navigator.of(context).pushReplacementNamed(authRoute);
            return const Center(child: GardenLoadingWidget());
          },
          unauthorized: () {
            context.watch<TokenCubit>().passValidation();
            return const Center(child: GardenLoadingWidget());
          },
          tokenSuccess: (token) => eventCubit.state.when(
            initial: () => const Center(
              child: GardenLoadingWidget(),
            ),
            loading: () => const Center(
              child: GardenLoadingWidget(),
            ),
            success: (eventList) {
              if (eventList.isEmpty) {
                eventCubit.load();
              }
              return _CalendarWrapper(
                eventList: eventList,
                currentViewType: currentViewType,
              );
            },
            fail: (message) => Center(
              child: GardenDefaultLabelWidget(text: message, fontSize: 18),
            ),
            remoteFail: (message) {
              eventCubit.loadLocally();
              return Center(
                child: GardenDefaultLabelWidget(text: message, fontSize: 18),
              );
            },
            localLoadingSuccess: (eventList) {
              if (eventList.isEmpty) {
                eventCubit.load();
              }
              return _CalendarWrapper(
                eventList: eventList,
                currentViewType: currentViewType,
              );
            },
          ),
        );
  }
}

Widget _buildEventTile(CalendarEventData event) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    decoration: BoxDecoration(
      color: event.color ?? Colors.blue,
      borderRadius: BorderRadius.circular(4),
    ),
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        event.title,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    ),
  );
}

class _CalendarWrapper extends StatefulWidget {
  final List<EventEntity> eventList;
  final CalendarViewType currentViewType;
  const _CalendarWrapper({
    required this.eventList,
    required this.currentViewType,
  });

  @override
  State<_CalendarWrapper> createState() => _CalendarWrapperState();
}

class _CalendarWrapperState extends State<_CalendarWrapper> {
  late GlobalKey<WeekViewState> _weekViewKey;
  late GlobalKey<MonthViewState> _monthViewKey;
  late GlobalKey<DayViewState> _dayViewKey;

  @override
  void initState() {
    super.initState();
    _weekViewKey = GlobalKey();
    _monthViewKey = GlobalKey();
    _dayViewKey = GlobalKey();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _scrollToCurrentTime();
      }
    });
  }

  void _scrollToCurrentTime() {
    WidgetsBinding.instance.endOfFrame.then((_) {
      if (!mounted) return;
      switch (widget.currentViewType) {
        case CalendarViewType.week:
          final event = _weekViewKey.currentState!.controller.allEvents.reduce(
            (current, next) =>
                current.date.isBefore(next.date) ? current : next,
          );
          _weekViewKey.currentState?.animateToEvent(event);
        case CalendarViewType.day:
          _dayViewKey.currentState?.animateToDate(DateTime.now());
        default:
          break;
      }
    });
  }

  void _showEditEventBottomSheet(EventEntity eventEntity) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modal) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: BlocProvider.of<TokenCubit>(context),
          ),
          BlocProvider.value(
            value: BlocProvider.of<EventCubit>(context),
          ),
          BlocProvider.value(
            value: BlocProvider.of<PlantListCubit>(context),
          ),
        ],
        child: EventCardBottomSheet(event: eventEntity),
      ),
    );
  }

  @override
  void didUpdateWidget(_CalendarWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.eventList != widget.eventList) {
      _updateCalendarEvents();
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _scrollToCurrentTime();
        }
      });
    }
  }

  void _updateCalendarEvents() {
    final controller = CalendarControllerProvider.of(context).controller;
    final events = widget.eventList.map(_convertToCalendarEvent).toList();

    controller.removeWhere((_) => true);
    controller.addAll(events);
  }

  CalendarEventData _convertToCalendarEvent(EventEntity e) {
    final date = e.date.toLocal();
    return CalendarEventData(
      title: e.title ?? "",
      date: DateTime(date.year, date.month, date.day),
      startTime: date,
      endTime: date.add(const Duration(hours: 1)),
      event: e,
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateCalendarEvents();
    });

    void eventTapHandler(List<CalendarEventData> event, DateTime date) {
      print(event);
    }

    switch (widget.currentViewType) {
      case CalendarViewType.month:
        return MonthView(
          key: _monthViewKey,
          onEventTap: (event, date) {
            final eventEntity = event.event! as EventEntity;
            _showEditEventBottomSheet(eventEntity);
          },
          controller: CalendarControllerProvider.of(context).controller,
          headerStringBuilder: (date, {secondaryDate}) {
            final monthNames = [
              "Январь",
              "Февраль",
              "Март",
              "Апрель",
              "Май",
              "Июнь",
              "Июль",
              "Август",
              "Сентябрь",
              "Октябрь",
              "Ноябрь",
              "Декабрь",
            ];
            return "${monthNames[date.month - 1]} ${date.year}";
          },
          weekDayStringBuilder: (p0) {
            final weekdays = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"];
            return weekdays[p0];
          },
          minMonth: DateTime(1990),
          maxMonth: DateTime(2050),
          cellAspectRatio: 1,
          onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
          onCellTap: (events, date) {
            print(events);
          },
          onEventDoubleTap: (events, date) => print(events),
          onEventLongTap: (event, date) => print(event),
          onDateLongPress: (date) => print(date),
          hideDaysNotInMonth: true,
          cellBuilder: (date, events, boundry, startDuration, endDuration) {
            const int maxEvents = 4;
            List<CalendarEventData> visibleEvents = events;
            int extraCount = 0;
            if (events.length > maxEvents) {
              visibleEvents = events.take(maxEvents).toList();
              extraCount = events.length - maxEvents;
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...visibleEvents.map((e) => ScaledEventTile(event: e)),
                if (extraCount > 0)
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Text(
                      "+ еще $extraCount",
                      style:
                          const TextStyle(fontSize: 10.0, color: Colors.grey),
                    ),
                  ),
              ],
            );
          },
        );
      case CalendarViewType.week:
        return WeekView(
          key: _weekViewKey,
          controller: CalendarControllerProvider.of(context).controller,
          headerStringBuilder: (date, {secondaryDate}) {
            final monthNames = [
              "Январь",
              "Февраль",
              "Март",
              "Апрель",
              "Май",
              "Июнь",
              "Июль",
              "Август",
              "Сентябрь",
              "Октябрь",
              "Ноябрь",
              "Декабрь",
            ];
            return "${monthNames[date.month - 1]} ${date.year}";
          },
          weekDayStringBuilder: (p0) {
            final weekdays = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"];
            return weekdays[p0];
          },
          onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
          onEventDoubleTap: (events, date) => print(events),
          onEventLongTap: (event, date) => print(event),
          onDateLongPress: (date) => print(date),
          timeLineBuilder: (date) => Stack(
            alignment: Alignment.topCenter,
            children: [Text("${date.hour.toString().padLeft(2, '0')}:00")],
          ),
          eventTileBuilder:
              (date, events, boundary, startDuration, endDuration) {
            return Stack(
              children: events.asMap().entries.map((entry) {
                final index = entry.key;
                final event = entry.value;
                final width = boundary.width / events.length;
                final left = index * width;

                return Positioned(
                  left: left,
                  top: 0,
                  width: width,
                  height: boundary.height,
                  child: GestureDetector(
                    onTap: () {
                      final eventEntity = event.event! as EventEntity;
                      _showEditEventBottomSheet(eventEntity);
                    },
                    child: _buildEventTile(event),
                  ),
                );
              }).toList(),
            );
          },
        );
      case CalendarViewType.day:
        return DayView(
          controller: CalendarControllerProvider.of(context).controller,
          onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
          onEventTap: (events, date) => eventTapHandler(events, date),
          onEventDoubleTap: (events, date) => print(events),
          onEventLongTap: (event, date) => print(event),
          onDateLongPress: (date) => print(date),
          timeLineBuilder: (date) => Stack(
            alignment: Alignment.topCenter,
            children: [Text("${date.hour.toString().padLeft(2, '0')}:00")],
          ),
          eventTileBuilder:
              (date, events, boundary, startDuration, endDuration) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: events.map((event) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: GestureDetector(
                    onTap: () {
                      final eventEntity = event.event! as EventEntity;
                      _showEditEventBottomSheet(eventEntity);
                    },
                    child: _buildEventTile(event),
                  ),
                );
              }).toList(),
            );
          },
        );
      case CalendarViewType.list:
        return Column(
          children: widget.eventList
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    final eventEntity = e;
                    _showEditEventBottomSheet(eventEntity);
                  },
                  child: EventListItem(event: e),
                ),
              )
              .toList(),
        );
    }
  }
}

class ScaledEventTile extends StatelessWidget {
  final CalendarEventData event;

  const ScaledEventTile({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1.0),
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
      decoration: BoxDecoration(
        color: event.color ?? Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          event.title,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class CalendarAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CalendarAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const Text(
        'Календарь',
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
