import 'package:flutter/cupertino.dart';
import 'package:lumyeditor/editor/content/selection_info.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Touching the editor then receive the message(selection of html focus node)
/// when receiving the message, the message is sended to [valueNotifier]

enum channel { Selection }

JavascriptChannel selectionChannel(ValueNotifier valueNotifier) {
  return new JavascriptChannel(
      name: 'selectionChannel',
      onMessageReceived: (JavascriptMessage javascriptMessage) {
        print("javascriptMessage: " + javascriptMessage.message);
        valueNotifier.value = SelectionInfo(javascriptMessage.message);
      });
}
