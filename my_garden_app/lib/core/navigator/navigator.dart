import 'package:flutter/material.dart';
import 'package:my_garden_app/feature/event_journal/presentation/pages/calendar_page.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/page/garden_visual_page.dart';
import 'package:my_garden_app/feature/plant_list/presentation/pages/plant_list_page.dart';

class MainNavigatorWidget extends StatefulWidget {
  const MainNavigatorWidget({super.key});

  @override
  State<MainNavigatorWidget> createState() => _MainNavigatorWidgetState();
}

class _MainNavigatorWidgetState extends State<MainNavigatorWidget> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const PlantListPage(),
    const CalendarPage(),
    const GardenVisualPage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 121, 150),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox_rounded),
            label: "Мои растения",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Календарь",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Карта",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
