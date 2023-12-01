import 'package:flutter/material.dart';
import 'package:flutter_bloc_basic/common_ui/utils/colors/common_colors.dart';
import 'package:flutter_bloc_basic/src/auth/presentation/login_page.dart';
import 'package:get_it/get_it.dart';

import '../../../core/data/local/app_preferences.dart';
import '../../employee/presentation/list_employee/list_employee_page.dart';

class SplashPage extends StatefulWidget {
  static const route = '/splash';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AppPreferences? prefs;
  var splashDuration = const Duration(seconds: 3);

  @override
  void initState() {
    super.initState();

    Future.delayed(splashDuration).then((value) {
      if ((prefs?.getToken() ?? '').isEmpty) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            LoginPage.route, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            ListEmployeePage.route, (Route<dynamic> route) => false);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    prefs = GetIt.instance<AppPreferences>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.blueE9,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Image.asset(
              'assets/images/transisi_logo.png',
              width: 200,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}