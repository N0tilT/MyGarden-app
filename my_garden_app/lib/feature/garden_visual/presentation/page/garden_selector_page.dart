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

class GardenSelectorPage extends StatefulWidget {
  const GardenSelectorPage({super.key});

  @override
  State<GardenSelectorPage> createState() => _GardenSelectorPageState();
}

class _GardenSelectorPageState extends State<GardenSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 241, 245),
      appBar: const GardenSelectorAppBarWidget(),
      body: BlocProvider<GardenCubit>(
        create: (context) => sl<GardenCubit>()..load(),
        child: const _GardenSelectorWidget(),
      ),
    );
  }
}

class _GardenSelectorWidget extends StatefulWidget {
  const _GardenSelectorWidget();

  @override
  State<_GardenSelectorWidget> createState() => _GardenSelectorWidgetState();
}

class _GardenSelectorWidgetState extends State<_GardenSelectorWidget> {
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
            const _GardenSelectionWidget(),
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

class _GardenSelectionWidget extends StatelessWidget {
  const _GardenSelectionWidget();

  @override
  Widget build(BuildContext context) {
    final gardenCubit = context.watch<GardenCubit>();
    return gardenCubit.state.maybeWhen(
      initial: () => Container(),
      loading: () => Container(),
      fail: (message) => GardenDefaultLabelWidget(text: message, fontSize: 16),
      orElse: () => const _GardenDropdownWidget(),
    );
  }
}

class _GardenDropdownWidget extends StatefulWidget {
  const _GardenDropdownWidget();

  @override
  State<_GardenDropdownWidget> createState() => __GardenDropdownWidgetState();
}

class __GardenDropdownWidgetState extends State<_GardenDropdownWidget> {
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
                setState(() {});
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

class GardenSelectorAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const GardenSelectorAppBarWidget({
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
        style: TextStyle( fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
