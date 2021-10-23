import 'dart:io';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewRenderController extends GetxController {
  late RxString url;

  WebViewRenderController() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    url = "".obs;
  }


}
