import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../local/app_preferences.dart';

class CookieInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    var prefs = GetIt.instance<AppPreferences>();
    if(response.data['token'] != null) {
      prefs.setToken(response.data['token']);
    }
    // var cookies = response.headers['set-cookie'];
    // print('asdasdasd1');
    // if (cookies != null && cookies.isNotEmpty) {
    //   print('asdasdasd2');
    //   var prefs = GetIt.instance<AppPreferences>();
    //
    //   var token = '';
    //
    //   for (var cookie in cookies) {
    //     print('asdasdasd3');
    //     if (cookie.startsWith('token')) {
    //       token = cookie
    //           .split(';')
    //           .where((e) => e.startsWith('token='))
    //           .first
    //           .replaceAll('token=', '');
    //     }
    //   }
    //
    //   if (token.isNotEmpty) {
    //      prefs.setToken(token);
    //   }
    // }

  }
}
