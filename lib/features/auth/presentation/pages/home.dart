import 'package:calendar_old/core/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:calendar_old/core/presentation/res/analytics.dart';
import 'package:calendar_old/features/home//home.dart';
import 'package:calendar_old/features/intro/intro.dart';
import '../../model/user_repository.dart';
import './splash.dart';
import './login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final user = watch(userRepoProvider);
        switch (user.status) {
          case Status.Unauthenticated:
          case Status.Authenticating:
            setCurrentScreen(context, AnalyticsScreenNames.welcome);
            return WelcomePage();
          case Status.Authenticated:
            setUserProperties(context,
                id: user.fbUser?.uid,
                name: user.fbUser?.displayName,
                email: user.fbUser?.email);
            setCurrentScreen(context, AnalyticsScreenNames.userInfo);
            if (user.isLoading) return Splash();
            return user.user?.introSeen ?? false ? HomePage() : IntroPage();
          case Status.Uninitialized:
          default:
            setCurrentScreen(context, AnalyticsScreenNames.splash);
            return Splash();
        }
      },
    );
  }
}
