

import 'dart:io';

class HttpCat {
  String statusCode;
  String image;

  HttpCat({required this.statusCode, required this.image});

  Map<String, dynamic> toMap() => {
        'statusCode': statusCode,
        'image': image,
      };
}
