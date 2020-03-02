import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

final selectionChannel = JavascriptChannel(
    name: 'selectionChannel',
    onMessageReceived: (JavascriptMessage message) {
      print(message);
    });
