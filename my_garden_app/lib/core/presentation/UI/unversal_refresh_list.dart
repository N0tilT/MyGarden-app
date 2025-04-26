import 'package:flutter/material.dart';

class UniversalRefreshList<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Future<void> Function() onRefresh;
  final EdgeInsetsGeometry? padding;
  final Widget? emptyWidget;

  const UniversalRefreshList({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onRefresh,
    this.padding,
    this.emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: items.isEmpty
                  ? _buildEmptyState(context, constraints)
                  : Column(
                      children: List.generate(
                        items.length,
                        (index) => itemBuilder(context, items[index], index),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, BoxConstraints constraints) {
    return SizedBox(
      height: constraints.maxHeight,
      child: emptyWidget ?? const Center(child: Text('No items')),
    );
  }
}
