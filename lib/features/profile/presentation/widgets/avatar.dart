import 'package:flutter/material.dart';
import 'package:calendar_old/core/presentation/res/colors.dart';

class Avatar extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final Color borderColor;
  final double radius;
  final double borderWidth;
  final Function onButtonPressed;
  final bool showButton;

  const Avatar(
      {required Key key,
        required this.image,
        required this.borderColor,
        this.radius = 30,
        required this.onButtonPressed,
        this.showButton = false,
        this.borderWidth = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        CircleAvatar(
          radius: radius,
          backgroundColor:
          borderColor != null ? borderColor : AppColors.primaryColorLight,
          child: CircleAvatar(
            radius: radius - borderWidth,
            //backgroundImage: image,
          ),
        ),
        if(showButton)
          Positioned(
            bottom: 0,
            right: -30,
            child: MaterialButton(
              elevation: 1,
              color: Colors.white,
              shape: CircleBorder(),
              child: Icon(Icons.camera_alt),
              padding: const EdgeInsets.all(4.0),
              onPressed: onButtonPressed(),
            ),
          )
      ],
    );
  }
}
