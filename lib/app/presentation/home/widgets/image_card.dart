import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageContent extends StatelessWidget {
  final String statusCode;
  final String  imageContent;
  final Function action;

  const ImageContent(
      {required this.statusCode,
      required this.imageContent,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
         color: Colors.red,
          child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(top: 5,bottom: 5),
          child: Text("Code: $statusCode",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800),),
        ),
        subtitle: Image.network(imageContent),
        onTap: action(),
      )),
    );
  }
}
