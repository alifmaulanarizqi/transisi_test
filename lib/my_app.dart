import 'package:flutter/material.dart';
import 'package:flutter_bloc_basic/src/auth/presentation/login_page.dart';
import 'package:flutter_bloc_basic/src/employee/list_employee/presentation/list_employee_page.dart';
import 'package:flutter_bloc_basic/src/example/presentation/example_page_1.dart';
import 'package:flutter_bloc_basic/src/example/presentation/example_page_2.dart';
import 'package:flutter_bloc_basic/src/splash/presenation/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.Up
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Basic',
      theme: ThemeData(
        navigationBarTheme: const NavigationBarThemeData(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.route,
      routes: {
        SplashPage.route: (ctx) => const SplashPage(),
        ExamplePage1.route: (ctx) => const ExamplePage1(),
        ExamplePage2.route: (ctx) => const ExamplePage2(),
        LoginPage.route: (ctx) => const LoginPage(),
        ListEmployeePage.route: (ctx) => const ListEmployeePage(),
      },
    );
  }
}
