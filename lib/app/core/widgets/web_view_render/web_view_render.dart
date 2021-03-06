import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/theme/font_size.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewRender extends StatefulWidget {
  final String url;

  const WebViewRender({required this.url});

  @override
  WebViewRenderState createState() => WebViewRenderState();
}

class WebViewRenderState extends State<WebViewRender> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "See More",
          style: TextStyle(fontSize: FontSize.FONT_SIZE_APP_BAR),
        ),
        elevation: 0,
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
