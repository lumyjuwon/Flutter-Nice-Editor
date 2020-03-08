import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:lumyeditor/editor/toolbar/menu.dart';
import 'package:lumyeditor/editor/toolbar/selection_info.dart';

import 'exec_command.dart';

class Toolbar extends StatefulWidget {
  final FlutterWebviewPlugin webviewPlugin;
  final ValueNotifier selectionListener;

  Toolbar({this.webviewPlugin, this.selectionListener}) : super();

  @override
  _ToolbarState createState() => _ToolbarState();

  void execCommand(CommandName name, [bool showDefaultUI, String argument]) {
    final String command = createCommand(name, showDefaultUI, argument);
    webviewPlugin.evalJavascript(command);
  }
}

class _ToolbarState extends State<Toolbar> {
  SelectionInfo selection;

  @override
  void initState() {
    super.initState();
    widget.selectionListener.addListener(() {
      this.setState(() {
        selection = widget.selectionListener.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Menu(
          tagName: TagName.FONT,
          icon: Icon(Icons.format_size),
          iconSize: 32.0,
          tooltip: 'Increase volume by 10',
          onPressed: () {},
          selection: this.selection,
        ),
        Menu(
          tagName: TagName.B,
          icon: Icon(Icons.format_bold),
          iconSize: 32.0,
          tooltip: 'Increase volume by 10',
          onPressed: () {
            widget.execCommand(CommandName.bold);
          },
          selection: this.selection,
        ),
        Menu(
          tagName: TagName.STRIKE,
          icon: Icon(Icons.format_strikethrough),
          iconSize: 32.0,
          tooltip: 'Increase volume by 10',
          onPressed: () {
            widget.execCommand(CommandName.strikethrough);
          },
          selection: this.selection,
        )
      ],
    );
  }
}
