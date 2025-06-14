import 'dart:async';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_garden_app/core/constant_values/routes.dart';
import 'package:my_garden_app/core/navigator/navigator.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/feature/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:my_garden_app/feature/auth/presentation/bloc/cubit/token_cubit.dart';
import 'package:my_garden_app/feature/auth/presentation/pages/main_auth_widget.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/page/garden_selector_page.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/page/garden_visual_page.dart';
import 'package:my_garden_app/feature/plant_list/presentation/pages/plant_list_page.dart';
import 'package:my_garden_app/injection_container.dart' as di;
import 'package:my_garden_app/injection_container.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<TokenCubit>()..getToken()),
        BlocProvider(create: (context) => sl<AuthBloc>()),
      ],
      child: CalendarControllerProvider(
        controller: EventController(),
        child: MaterialApp(
          title: 'Мой сад',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 216, 243, 203),
              foregroundColor: Colors.black,
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Color.fromARGB(255, 22, 81, 41),
            ),
            fontFamily: 'Inter',
          ),
          home: const _SplashScreen(),
          routes: {
            mainRoute: (context) => const MainNavigatorWidget(),
            authRoute: (context) => const MainAuthPage(),
            plantListRoute: (context) => const PlantListPage(),
            gardenSelector: (context) => const GardenSelectorPage(),
            gardenVisual: (context) => const GardenVisualPage(),
          },
        ),
      ),
    );
  }
}

class _SplashScreen extends StatefulWidget {
  const _SplashScreen();

  @override
  State<_SplashScreen> createState() => __SplashScreenState();
}

class __SplashScreenState extends State<_SplashScreen> {
  Timer? _timer; // Add a timer reference

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    _timer = Timer(const Duration(seconds: 3, milliseconds: 500), () {
      if (mounted) {
        // Check if widget is still mounted
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Initializer()),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer on dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(child: GardenLoadingWidget()),
    );
  }
}

class Initializer extends StatefulWidget {
  const Initializer({super.key});

  @override
  State<Initializer> createState() => _InitializerState();
}

class _InitializerState extends State<Initializer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tokenCubit = context.watch<TokenCubit>();
    return tokenCubit.state.when(
      initial: () => const Center(child: GardenLoadingWidget()),
      authorized: (token) => const Center(child: GardenLoadingWidget()),
      fail: (l) => const MainAuthPage(),
      unauthorized: () {
        tokenCubit.passValidation();
        return const Center(child: GardenLoadingWidget());
      },
      tokenSuccess: (token) {
        return const MainNavigatorWidget();
      },
    );
  }
}
