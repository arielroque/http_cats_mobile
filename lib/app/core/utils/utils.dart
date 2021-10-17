import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class Utils{
  static Future<File> createFileFromBytes(String filename,String data,String extension) async {
    print("to dentroo");
    Uint8List bytes = base64.decode(data);
    print("jfsdfk");
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File("$dir/$filename.$extension");
    await file.writeAsBytes(bytes);
    return file;
  }

}