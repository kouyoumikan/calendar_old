import 'package:calendar_old/core/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_old/features/profile/data/model/user_field.dart';
import 'package:calendar_old/features/profile/data/service/user_db_service.dart';
import 'package:calendar_old/generated/l10n.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          //implement intro screen
          Spacer(),
          RaisedButton(
            onPressed: () {
              _finishIntroScreen(context);
            },
            child: Text(S.of(context).introFinishButtonLabel),
          )
        ],
      ),
    );
  }

  _finishIntroScreen(BuildContext context) async {
    await userDBS.updateData(context.read(userRepoProvider).user.id, {
      UserFields.introSeen: true,
    });
  }
}
