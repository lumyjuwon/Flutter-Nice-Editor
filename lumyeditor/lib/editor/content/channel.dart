import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:lumyeditor/editor/toolbar/selection_info.dart';

JavascriptChannel selectionChannel(ValueNotifier valueNotifier) {
  return new JavascriptChannel(
      name: 'selectionChannel',
      onMessageReceived: (JavascriptMessage javascriptMessage) {
        valueNotifier.value = SelectionInfo(javascriptMessage.message);
      });
}
