import 'package:lumyeditor/utils/enum.dart';

import 'selection_info.dart';

enum CommandName {
  fontSize,
  bold,
  strikethrough,
}

CommandName getCommandNameByTag(TagName tag) {
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

/// HTML5 contentEditable API (https://developer.mozilla.org/docs/Web/API/Document/execCommand)
String createExecCommand(CommandName name,
    [bool showDefaultUI = false, String argument]) {
  print("createGetExecCommand");

  return 'document.execCommand("${enumToString(name)}", $showDefaultUI, $argument)';
}

String createGetExecCommand(TagName tag) {
  print("createGetExecCommand");

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
