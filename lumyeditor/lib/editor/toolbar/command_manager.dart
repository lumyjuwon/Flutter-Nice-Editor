import 'package:lumyeditor/utils/util.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:lumyeditor/editor/content/selection_info.dart';

/// HTML5 contentEditable API (https://developer.mozilla.org/docs/Web/API/Document/execCommand)

/// [CommandName] is a enum that's used in executing command
enum CommandName {
  fontSize,
  bold,
  italic,
  underline,
  strikeThrough,
  justifyLeft,
  justifyCenter,
  justifyRight,
  backColor,
  foreColor
}

class CommandManager {
  static String initVariables() {
    List<String> commandNames = new List<String>();
    List<String> tagNames = new List<String>();

    (CommandName.values).forEach(
        (value) => {commandNames.add("'" + enumToString(value) + "'")});

    (TagName.values)
        .forEach((value) => {tagNames.add("'" + enumToString(value) + "'")});

    String commandListStr = commandNames.toString();
    String tagListStr = tagNames.toString();

    return '''
    const commandNames = $commandListStr;
    const tagNames = $tagListStr;
    ''';
  }

  static void execCommand(WebViewController webViewController, String command) {
    webViewController.evaluateJavascript(command);
  }

  static String createExecCommand(CommandName name, [String value]) {
    print('document.execCommand("${enumToString(name)}", false, "$value")');
    return 'document.execCommand("${enumToString(name)}", false, "$value")';
  }

  static String createCheckExecCommand() {
    print('createCheckExecCommand');

    return '''  
      selectionChannel.postMessage(getCurrentCommandState());
    ''';
  }

  static String createRemoveExecCommand() {}
}
