enum CommandName {
  fontSize,
  bold,
}

String enumToString(CommandName name) {
  return name.toString().split('.')[1];
}

String createCommand(CommandName name,
    [bool showDefaultUI = false, String argument]) {
  return 'document.execCommand("${enumToString(name)}", $showDefaultUI, $argument)';
}
