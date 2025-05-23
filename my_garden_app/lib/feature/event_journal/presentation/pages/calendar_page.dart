// ignore_for_file: avoid_print

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
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

class _CalendarWrapper extends StatelessWidget {
  final List<EventEntity> eventList;
  final CalendarViewType currentViewType;
  const _CalendarWrapper({
    required this.eventList,
    required this.currentViewType,
  });

  @override
  Widget build(BuildContext context) {
    CalendarControllerProvider.of(context).controller.addAll(
          eventList
              .map(
                (e) => CalendarEventData(
                  title: e.title ?? "",
                  date: e.date.toLocal(),
                ),
              )
              .toList(),
        );

    switch (currentViewType) {
      case CalendarViewType.month:
        return MonthView(
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
          onEventTap: (event, date) => print(event),
          onEventDoubleTap: (events, date) => print(events),
          onEventLongTap: (event, date) => print(event),
          onDateLongPress: (date) => print(date),
          hideDaysNotInMonth: true,
        );
      case CalendarViewType.week:
        return WeekView(
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
          onEventTap: (event, date) => print(event),
          onEventDoubleTap: (events, date) => print(events),
          onEventLongTap: (event, date) => print(event),
          onDateLongPress: (date) => print(date),
        );
      case CalendarViewType.day:
        return DayView(
          controller: CalendarControllerProvider.of(context).controller,
          onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
          onEventTap: (event, date) => print(event),
          onEventDoubleTap: (events, date) => print(events),
          onEventLongTap: (event, date) => print(event),
          onDateLongPress: (date) => print(date),
        );
      case CalendarViewType.list:
        return Column(
          children: eventList
              .map(
                (e) => EventListItem(event: e),
              )
              .toList(),
        );
    }
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
