import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/theme/color_theme.dart';
import 'package:flutter_clean_architecture/app/theme/font_size.dart';

class Spinner extends StatelessWidget {
  final double size;
  final Color color;
  final String message;
  final double messageSize;
  final Color messageColor;

  const Spinner(
      {Key? key,
      this.size = FontSize.FONT_SIZE_EXTRA_LARGE,
      this.color = ColorTheme.PRIMARY_COLOR,
      this.message = "",
      this.messageSize = FontSize.FONT_SIZE_REGULAR,
      this.messageColor = ColorTheme.BLACK})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            color: color,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Visibility(
            visible: message.isNotEmpty,
            child: Text(this.message,
                style: TextStyle(fontSize: messageSize, color: messageColor),
                textDirection: TextDirection.ltr))
      ],
    );
  }
}
