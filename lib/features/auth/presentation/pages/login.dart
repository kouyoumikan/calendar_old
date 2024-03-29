import 'package:calendar_old/core/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:calendar_old/generated/l10n.dart';
import '../widgets/auth_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  late bool _authVisible;
  late int _selectedTab;

  @override
  void initState() {
    super.initState();
    _authVisible = false;
    _selectedTab = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
            ),
            width: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: kToolbarHeight),
              Text(
                S.of(context).loginPageTitleText,
                style: Theme.of(context).textTheme.display2!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Frank"),
              ),
              Text(
                S.of(context).loginPageSubtitleText,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        elevation: 0,
                        highlightElevation: 0,
                        child: Text(S.of(context).loginButtonText),
                        onPressed: () => setState(() {
                          _authVisible = true;
                          _selectedTab = 0;
                        }),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: OutlineButton(
                        textColor: Colors.white,
                        child: Text(S.of(context).signupButtonText),
                        onPressed: () => setState(() {
                          _authVisible = true;
                          _selectedTab = 1;
                        }),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                child: Text(S.of(context).googleButtonText),
                onPressed: () async {
                  if (!await context.read(userRepoProvider).signInWithGoogle())
                    _key.currentState!.showSnackBar(SnackBar(
                      content: Text("Something is wrong"),
                    ));
                },
              ),
              const SizedBox(height: 10.0),
            ],
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _authVisible
                ? Container(
              color: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AuthDialog(
                  selectedTab: _selectedTab,
                  onClose: () {
                    setState(() {
                      _authVisible = false;
                    });
                  },
                  key: _key,
                ),
              ),
            )
                : null,
          )
        ],
      ),
    );
  }
}

