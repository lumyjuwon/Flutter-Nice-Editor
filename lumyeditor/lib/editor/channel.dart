import 'package:webview_flutter/webview_flutter.dart';

final toolbarChannel = JavascriptChannel(
    name: 'toolbarChannel',
    onMessageReceived: (JavascriptMessage message) {
      print(message);
    });
