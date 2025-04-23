// ignore_for_file: avoid_print

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/core/presentation/label/garden_default_label_widget.dart';
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';
import 'package:my_garden_app/feature/event_journal/presentation/bloc/cubit/event_cubit.dart';
import 'package:my_garden_app/feature/event_journal/presentation/pages/event_adding_page.dart';
import 'package:my_garden_app/injection_container.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CalendarAppBarWidget(),
      body: BlocProvider<EventCubit>(
        create: (context) => sl<EventCubit>()..load(),
        child: const _CalendarWidget(),
      ),
    );
  }
}

class _CalendarWidget extends StatelessWidget {
  const _CalendarWidget();

  @override
  Widget build(BuildContext context) {
    final eventCubit = context.watch<EventCubit>();

    return eventCubit.state.when(
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
              .map((e) => CalendarEventData(title: e.title ?? "", date: e.date))
              .toList(),
        );
    return Stack(children: [
      MonthView(
        controller: CalendarControllerProvider.of(context).controller,
        minMonth: DateTime(1990),
        maxMonth: DateTime(2050),
        cellAspectRatio: 1,
        onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
        onCellTap: (events, date) {
          // Implement callback when user taps on a cell.
          print(events);
        },
        // This callback will only work if cellBuilder is null.
        onEventTap: (event, date) => print(event),
        onEventDoubleTap: (events, date) => print(events),
        onEventLongTap: (event, date) => print(event),
        onDateLongPress: (date) => print(date),
        hideDaysNotInMonth:
            true, // To hide days or cell that are not in current month
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const EventAddingPage(),
                ),
              );
            },
            child: const Text(
              "+",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    ]);
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
