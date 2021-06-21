import 'package:calendar_old/core/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:calendar_old/core/presentation/res/analytics.dart';
import 'package:calendar_old/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoPage extends StatelessWidget {
  final User user;

  const UserInfoPage({required Key key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profilePageTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Text(user.email),
            RaisedButton(
              child: Text(S.of(context).logoutButtonText),
              onPressed: () {
                logEvent(context, AppAnalyticsEvents.logOut, params: {});
                context.read(userRepoProvider).signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
