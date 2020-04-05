import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:lumyeditor/editor/toolbar/selection_info.dart';

/// Touching the editor then receive the message(selection of html focus node)
/// when receiving the message, the message is sended to [valueNotifier]
JavascriptChannel selectionChannel(ValueNotifier valueNotifier) {
  return new JavascriptChannel(
      name: 'selectionChannel',
      onMessageReceived: (JavascriptMessage javascriptMessage) {
        print(javascriptMessage.message);
        valueNotifier.value = SelectionInfo(javascriptMessage.message);
      });
}
