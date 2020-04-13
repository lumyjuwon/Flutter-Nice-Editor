import 'package:lumyeditor/utils/enum.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:lumyeditor/editor/content/selection_info.dart';

/// HTML5 contentEditable API (https://developer.mozilla.org/docs/Web/API/Document/execCommand)

enum CommandName {
  fontSize,
  bold,
  strikethrough,
}

class CommandManager {
  CommandManager();

  static CommandName getCommandNameByTag(TagName tag) {
    switch (tag) {
      case TagName.FONT:
        return CommandName.fontSize;
      case TagName.B:
        return CommandName.bold;
      case TagName.STRIKE:
        return CommandName.strikethrough;
      default:
        return null;
    }
  }

  static void execCommand(WebViewController webViewController, String command) {
    webViewController.evaluateJavascript(command);
  }

  static String createExecCommand(CommandName name,
      [bool showDefaultUI = false, String argument]) {
    return 'document.execCommand("${enumToString(name)}", $showDefaultUI, $argument)';
  }

  static String createCheckExecCommand(TagName tag) {
    String commandName = enumToString(getCommandNameByTag(tag));
    String value = enumToString(tag);

    return '''
    commandState = document.queryCommandState("$commandName");

    if(commandState){
      attributions = getAttributions(document.getSelection().focusNode) + ", $value";

      selectionChannel.postMessage(attributions);
    }
    else{
      attributions = getAttributions(document.getSelection().focusNode).replace("$value", "");

      selectionChannel.postMessage(attributions);
    }
  ''';
  }
}
