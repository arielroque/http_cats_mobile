import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/theme/font_size.dart';

class Spinner extends StatelessWidget {
  final String message;
  final double size;

  const Spinner({this.message = "",this.size=40});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size,
          height: size ,
          child: CircularProgressIndicator(
            color: Colors.redAccent,
          ),
        ),
        SizedBox(height: 15,),
        Visibility(visible: message.isNotEmpty, child: Text(this.message,style: TextStyle(fontSize: FontSize.FONT_SIZE_REGULAR),))
      ],
    );
  }
}
