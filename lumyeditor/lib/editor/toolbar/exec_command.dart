import 'package:lumyeditor/utils/enum.dart';

enum CommandName {
  fontSize,
  bold,
  strikethrough,
}

String createCommand(CommandName name,
    [bool showDefaultUI = false, String argument]) {
  return 'document.execCommand("${enumToString(name)}", $showDefaultUI, $argument)';
}
