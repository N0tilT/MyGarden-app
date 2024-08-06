import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/constant_values/routes.dart';
import 'package:my_garden_app/core/presentation/button_widget.dart';
import 'package:my_garden_app/core/presentation/label/garden_default_label_widget.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/garden_entity.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/bloc/garden/garden_cubit.dart';
import 'package:my_garden_app/injection_container.dart';

final dropdownBoxDecoration = BoxDecoration(
  border: Border.all(color: const Color(0xFFAA8DD3), width: 1.5),
  borderRadius: const BorderRadius.all(Radius.circular(5)),
  color: Colors.white,
);

class GroupSelectorPage extends StatefulWidget {
  const GroupSelectorPage({super.key});

  @override
  State<GroupSelectorPage> createState() => _GroupSelectorPageState();
}

class _GroupSelectorPageState extends State<GroupSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 241, 245),
      appBar: const GroupSelectorAppBarWidget(),
      body: BlocProvider<GardenCubit>(
        create: (context) => sl<GardenCubit>()..load(),
        child: const _GroupSelectorWidget(),
      ),
    );
  }
}

class _GroupSelectorWidget extends StatefulWidget {
  const _GroupSelectorWidget();

  @override
  State<_GroupSelectorWidget> createState() => _GroupSelectorWidgetState();
}

class _GroupSelectorWidgetState extends State<_GroupSelectorWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<GardenCubit>(context).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 57, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const _GroupSelectionWidget(),
            GardenButton(
              title: "Подтвердить",
              event: () {
                Navigator.of(context).pushReplacementNamed(gardenVisual);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupSelectionWidget extends StatelessWidget {
  const _GroupSelectionWidget();

  @override
  Widget build(BuildContext context) {
    final gardenCubit = context.watch<GardenCubit>();
    return gardenCubit.state.maybeWhen(
      initial: () => Container(),
      loading: () => Container(),
      fail: (message) => GardenDefaultLabelWidget(text: message, fontSize: 16),
      orElse: () => const _GroupDropdownWidget(),
    );
  }
}

class _GroupDropdownWidget extends StatefulWidget {
  const _GroupDropdownWidget();

  @override
  State<_GroupDropdownWidget> createState() => __GroupDropdownWidgetState();
}

class __GroupDropdownWidgetState extends State<_GroupDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    final gardenCubit = context.watch<GardenCubit>();

    return Container(
      decoration: dropdownBoxDecoration,
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<GardenEntity>(
              onChanged: (GardenEntity? value) {
                setState(() {
                  gardenCubit.setSelected(value!);
                });
              },
              value: gardenCubit.selectedGarden,
              padding: const EdgeInsets.only(left: 12),
              isExpanded: true,
              items: gardenCubit.gardens.map<DropdownMenuItem<GardenEntity>>(
                (GardenEntity item) {
                  return DropdownMenuItem<GardenEntity>(
                    value: item,
                    child: Center(child: Text(item.toString())),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class GroupSelectorAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const GroupSelectorAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const Text(
        'Выбор сада',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
