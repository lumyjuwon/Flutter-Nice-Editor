import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'exec_command.dart';

class Toolbar extends StatefulWidget {
  final FlutterWebviewPlugin flutterWebviewPlugin;
  Toolbar(this.flutterWebviewPlugin) : super();

  @override
  _ToolbarState createState() => _ToolbarState();

  void execCommand(CommandName name, [bool showDefaultUI, String argument]) {
    final String command = createCommand(name, showDefaultUI, argument);
    flutterWebviewPlugin.evalJavascript(command);
  }
}

class _ToolbarState extends State<Toolbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.format_size),
          iconSize: 32.0,
          tooltip: 'Increase volume by 10',
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.format_bold),
          iconSize: 32.0,
          tooltip: 'Increase volume by 10',
          onPressed: () {
            widget.execCommand(CommandName.bold);
          },
        )
      ],
    );
  }
}
