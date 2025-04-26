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
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_list/plant_list_cubit.dart';
import 'package:my_garden_app/injection_container.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
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
        body: const _CalendarWidget(),
        floatingActionButton: Builder(
          builder: (parentContext) {
            return FloatingActionButton(
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
                        value: BlocProvider.of<PlantListCubit>(parentContext),
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
      ),
    );
  }
}

class _CalendarWidget extends StatelessWidget {
  const _CalendarWidget();

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
              return _CalendarWrapper(eventList: eventList);
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
              );
            },
          ),
        );
  }
}

class _CalendarWrapper extends StatelessWidget {
  final List<EventEntity> eventList;
  const _CalendarWrapper({required this.eventList});

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
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
