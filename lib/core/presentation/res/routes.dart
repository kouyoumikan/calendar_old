import 'package:calendar_old/features/events/pages/add_event.dart';
import 'package:calendar_old/features/events/pages/event_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:calendar_old/features/auth/presentation/pages/home.dart';
import 'package:calendar_old/features/auth/presentation/pages/splash.dart';
import 'package:calendar_old/features/auth/presentation/pages/user_info.dart';
import 'package:calendar_old/features/profile/presentation/pages/edit_profile.dart';
import 'package:calendar_old/features/profile/presentation/pages/profile.dart';

class AppRoutes {
  static const home = "/";
  static const splash = "splash";
  static const login = "login";
  static const signup = "signup";
  static const userInfo = "user_info";
  static const String profile = "profile";
  static const String editProfile = "edit_profile";
  static const String addEvent = "add_event";
  static const String editEvent = "edit_event";
  static const String viewEvent = "view_event";

  static get user => user;

  static get key => key;

  static get event => event;

  static get selectedDate => selectedDate;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (_) {
          switch (settings.name) {
            case editEvent:
              return AddEventPage(
                  key: key, selectedDate: selectedDate, event: event
              );
            case viewEvent:
              return EventDetails(
                  key: key, event: event
              );
            case addEvent:
              return AddEventPage(
                  key: key, selectedDate: selectedDate, event: event
              );
            case home:
              return AuthHomePage();
            case userInfo:
              return UserInfoPage(
                  key: key, user: user
              );
            case editProfile:
              return EditProfile(
                  key: key, user: user
              );
            case profile:
              return UserProfile();
            case splash:
            default:
              return Splash();
          }
        });
  }
}
