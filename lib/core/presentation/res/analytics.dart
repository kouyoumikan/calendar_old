import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:calendar_old/core/presentation/providers/providers.dart';
import 'package:flutter/widgets.dart';
import 'package:calendar_old/core/presentation/res/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppAnalyticsEvents {
  static const String logOut = "log_out";
}

class AnalyticsScreenNames {
  static const String welcome = "Welcome page";
  static const String splash = "Splash screen";
  static const String login = "Login Screen";
  static const String userInfo = "User profile";
  static const String root = "Root page";
}

FirebaseAnalytics _getAnalytics(BuildContext context) =>
    context.read<FirebaseAnalytics>(analyticsProvider);

Future<void> logEvent(BuildContext context, String name,
    {required Map<String, dynamic> params}) {
  return _getAnalytics(context).logEvent(name: name, parameters: params);
}

Future<void> setCurrentScreen(BuildContext context, String name) {
  return _getAnalytics(context).setCurrentScreen(screenName: name);
}

Future<void> setUserProperties(BuildContext context,
    {required String id, required String name, required String email}) async {
  await _getAnalytics(context).setUserId(id);
  await _getAnalytics(context).setUserProperty(name: "email", value: email);
  await _getAnalytics(context).setUserProperty(name: "name", value: name);
  return;
}

String analyticsNameExtractor(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.userInfo:
      return AnalyticsScreenNames.userInfo;
    case AppRoutes.login:
      return AnalyticsScreenNames.login;
    case AppRoutes.splash:
      return AnalyticsScreenNames.splash;
    case AppRoutes.home:
    default:
      return AnalyticsScreenNames.root;
  }
}
