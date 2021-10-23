import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/core/utils/constants.dart';
import 'package:flutter_clean_architecture/app/core/widgets/web_view_render/web_view_render.dart';
import 'package:flutter_clean_architecture/app/theme/color_theme.dart';
import 'package:flutter_clean_architecture/app/theme/font_size.dart';

class ImageContent extends StatelessWidget {
  final String statusCode;
  final String imageUrl;
  final Function action;

  const ImageContent(
      {required this.statusCode, required this.imageUrl, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorTheme.GREY ,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorTheme.PRIMARY_COLOR,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(statusCode,style: TextStyle(fontSize: FontSize.FONT_SIZE_LARGE,color: Colors.white,fontWeight: FontWeight.w700),),
                          SizedBox(height: 10,),
                          OutlinedButton(

                              style: ElevatedButton.styleFrom(primary: ColorTheme.WHITE,shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)) ),
                              onPressed: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return WebViewRender(url:"${Constants.HTTP_CODE_DOCS}/$statusCode");
                                }));

                              }, child: Row(children: [
                            Icon(Icons.language,color: Colors.black,),
                            SizedBox(width: 10,),
                            Text("See more",style: TextStyle(color: Colors.black),)
                          ],)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(21.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
