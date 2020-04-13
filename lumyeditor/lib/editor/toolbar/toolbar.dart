import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:lumyeditor/editor/content/selection_info.dart';
import 'package:lumyeditor/editor/editor.dart';
import 'package:lumyeditor/editor/toolbar/command_manager.dart';
import 'package:lumyeditor/editor/toolbar/button/menu.dart';
import 'package:lumyeditor/editor/toolbar/button/expand_menu.dart';

class Toolbar extends StatefulWidget {
  final Position position;
  final ValueNotifier selectionListener;
  final WebViewController webviewController;

  Toolbar(
      {@required this.position,
      @required this.webviewController,
      @required this.selectionListener})
      : super();

  @override
  _ToolbarState createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  SelectionInfo selection;

  @override
  void initState() {
    super.initState();

    widget.selectionListener.addListener(() {
      print(widget.selectionListener.value);
      this.setState(() {
        selection = widget.selectionListener.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ExpandMenu(
            position: widget.position,
            icon: Icon(Icons.format_size),
            iconSize: 32.0,
            tooltip: 'Increase volume by 10',
            menus: [
              Menu(
                tagName: TagName.B,
                icon: Icon(Icons.format_bold),
                iconSize: 32.0,
                tooltip: 'Increase volume by 10',
                onPressed: () {
                  CommandManager.execCommand(widget.webviewController,
                      CommandManager.createExecCommand(CommandName.bold));

                  CommandManager.execCommand(widget.webviewController,
                      CommandManager.createCheckExecCommand(TagName.B));
                },
                selection: this.selection,
              ),
              Menu(
                tagName: TagName.STRIKE,
                icon: Icon(Icons.format_strikethrough),
                iconSize: 32.0,
                tooltip: 'Increase volume by 10',
                onPressed: () {
                  CommandManager.execCommand(
                      widget.webviewController,
                      CommandManager.createExecCommand(
                          CommandName.strikethrough));

                  CommandManager.execCommand(widget.webviewController,
                      CommandManager.createCheckExecCommand(TagName.STRIKE));
                },
                selection: this.selection,
              )
            ]),
        Menu(
          tagName: TagName.B,
          icon: Icon(Icons.format_bold),
          iconSize: 32.0,
          tooltip: 'Increase volume by 10',
          onPressed: () {
            CommandManager.execCommand(widget.webviewController,
                CommandManager.createExecCommand(CommandName.bold));

            CommandManager.execCommand(widget.webviewController,
                CommandManager.createCheckExecCommand(TagName.B));
          },
          selection: this.selection,
        ),
        Menu(
          tagName: TagName.STRIKE,
          icon: Icon(Icons.format_strikethrough),
          iconSize: 32.0,
          tooltip: 'Increase volume by 10',
          onPressed: () {
            CommandManager.execCommand(widget.webviewController,
                CommandManager.createExecCommand(CommandName.strikethrough));

            CommandManager.execCommand(widget.webviewController,
                CommandManager.createCheckExecCommand(TagName.STRIKE));
          },
          selection: this.selection,
        )
      ],
    );
  }
}
