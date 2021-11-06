import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/app/theme/font_size.dart';

class LabelMessage extends StatelessWidget {
  final String imageAssetPath;
  final String message;
  const LabelMessage({required this.imageAssetPath, required this.message});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(imageAssetPath,height: height*0.4,),
              SizedBox(height: 30,),
              Text(message,style: TextStyle(fontSize: FontSize.FONT_SIZE_MEDIUM),)
            ],
          ),
        ),
      ),
    );
  }
}
