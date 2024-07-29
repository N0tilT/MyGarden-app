import 'package:flutter/material.dart';
import 'package:my_garden_app/core/constant_values/routes.dart';
import 'package:my_garden_app/core/presentation/button_widget.dart';
import 'package:my_garden_app/feature/auth/presentation/pages/login_auth_page.dart';
import 'package:my_garden_app/resources/colors.dart';

class MainAuthPage extends StatefulWidget {
  const MainAuthPage({super.key});

  @override
  State<MainAuthPage> createState() => _MainAuthPageState();
}

class _MainAuthPageState extends State<MainAuthPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: mainAuthBackgroundColor,
      body: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TODO: Icon here
          const SizedBox(
            height: 40,
          ),
          GardenButton(
            title: "Войти",
            event: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const LoginAuthPage(route: mainRoute),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
