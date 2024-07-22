import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/core/presentation/label/garden_default_label_widget.dart';
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';
import 'package:my_garden_app/feature/event_journal/presentation/bloc/cubit/event_cubit.dart';
import 'package:my_garden_app/feature/event_journal/presentation/pages/event_adding_page.dart';
import 'package:my_garden_app/feature/event_journal/presentation/widgets/event_list_widget.dart';
import 'package:my_garden_app/injection_container.dart';

class EventJournalPage extends StatefulWidget {
  const EventJournalPage({super.key});

  @override
  _EventJournalPageState createState() => _EventJournalPageState();
}

class _EventJournalPageState extends State<EventJournalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 241, 245),
      appBar: const EventAppBarWidget(),
      body: BlocProvider<EventCubit>(
        create: (context) => sl<EventCubit>()..load(),
        child: const _EventListWidget(),
      ),
    );
  }
}

class _EventListWidget extends StatefulWidget {
  const _EventListWidget();

  @override
  _EventListWidgetState createState() => _EventListWidgetState();
}

class _EventListWidgetState extends State<_EventListWidget> {
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
        return _EventListWrapper(eventList: eventList);
      },
      fail: (message) => Center(
        child: GardenDefaultLabelWidget(text: message, fontSize: 18),
      ),
      localLoadingFail: (message) {
        eventCubit.load();
        return Center(
          child: GardenDefaultLabelWidget(text: message, fontSize: 18),
        );
      },
      localLoadingSuccess: (eventList) {
        if (eventList.isEmpty) {
          eventCubit.load();
        }
        return _EventListWrapper(
          eventList: eventList,
        );
      },
    );
  }
}

class _EventListWrapper extends StatelessWidget {
  final List<EventEntity> eventList;

  const _EventListWrapper({
    required this.eventList,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: eventList
              .map(
                (e) => EventListItem(event: e),
              )
              .toList(),
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
      ],
    );
  }
}

class EventAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const EventAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const Text(
        'Планы',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
