import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        Visibility(visible: message.isNotEmpty, child: Text(this.message,style: TextStyle(fontSize: 20),))
      ],
    );
  }
}
