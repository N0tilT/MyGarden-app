// group_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/widgets/plant_list_item.dart';
import 'package:sliver_tools/sliver_tools.dart';

class GroupList extends StatefulWidget {
  final List<Group> groups;
  final void Function() onAddGroup;
  final Future<void> Function() onRefresh;

  const GroupList({
    super.key,
    required this.groups,
    required this.onAddGroup,
    required this.onRefresh,
  });

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => RefreshIndicator(
        onRefresh: widget.onRefresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverStickyHeader(
              header: _buildStickyAddButton(),
              sliver: MultiSliver(
                children: [
                  ...widget.groups.map(
                    (group) => SliverStickyHeader(
                      header: _buildGroupHeader(group),
                      sliver: group.isExpanded
                          ? SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  return PlantListItem(
                                    plant: group.plants[index],
                                  );
                                },
                                childCount: group.plants.length,
                              ),
                            )
                          : const SliverToBoxAdapter(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStickyAddButton() {
    return ColoredBox(
      color: Colors.white,
      child: TextButton(
        onPressed: widget.onAddGroup,
        child: const Text(
          'Новая группа',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildGroupHeader(Group group) {
    return GestureDetector(
      onTap: () => setState(() => group.isExpanded = !group.isExpanded),
      child: Container(
        height: 60,
        color: Colors.grey[200],
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Expanded(
              child: Text(
                group.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              group.isExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              color: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }
}

class Group {
  String name;
  List<PlantEntity> plants;
  bool isExpanded;

  Group({
    required this.name,
    required this.plants,
    this.isExpanded = true,
  });
}
