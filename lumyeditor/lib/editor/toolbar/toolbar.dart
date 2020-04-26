import 'package:flutter/material.dart';
import 'package:lumyeditor/editor/toolbar/button/color_menu.dart';
import 'package:lumyeditor/utils/util.dart';
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
      this.setState(() {
        selection = widget.selectionListener.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
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
                            CommandName.strikeThrough));
                  },
                  selection: this.selection,
                )
              ]),
          ExpandMenu(
              position: widget.position,
              icon: Icon(Icons.format_color_text),
              iconSize: 32.0,
              tooltip: 'Increase volume by 10',
              menus: [
                ColorMenu(
                  fillColor: Colors.black,
                  onPress: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(CommandName.foreColor,
                            getColorValue(Colors.black)));
                  },
                ),
                ColorMenu(
                  fillColor: Colors.grey,
                  onPress: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(
                            CommandName.foreColor, getColorValue(Colors.grey)));
                  },
                ),
                ColorMenu(
                  fillColor: Colors.redAccent,
                  onPress: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(CommandName.foreColor,
                            getColorValue(Colors.redAccent)));
                  },
                ),
                ColorMenu(
                  fillColor: Colors.orangeAccent,
                  onPress: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(CommandName.foreColor,
                            getColorValue(Colors.orangeAccent)));
                  },
                ),
                ColorMenu(
                  fillColor: Colors.greenAccent,
                  onPress: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(CommandName.foreColor,
                            getColorValue(Colors.greenAccent)));
                  },
                ),
                ColorMenu(
                  fillColor: Colors.lightBlue,
                  onPress: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(CommandName.foreColor,
                            getColorValue(Colors.lightBlue)));
                  },
                ),
              ]),
          ExpandMenu(
              position: widget.position,
              icon: Icon(Icons.format_color_fill),
              iconSize: 32.0,
              tooltip: 'Increase volume by 10',
              menus: [
                ColorMenu(
                  fillColor: Colors.transparent,
                  onPress: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(
                            CommandName.backColor, 'transparent'));
                  },
                ),
                ColorMenu(
                  fillColor: Colors.grey,
                  onPress: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(
                            CommandName.backColor, getColorValue(Colors.grey)));
                  },
                ),
                ColorMenu(
                  fillColor: Colors.redAccent,
                  onPress: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(CommandName.backColor,
                            getColorValue(Colors.redAccent)));
                  },
                ),
                ColorMenu(
                  fillColor: Colors.orangeAccent,
                  onPress: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(CommandName.backColor,
                            getColorValue(Colors.orangeAccent)));
                  },
                ),
                ColorMenu(
                  fillColor: Colors.greenAccent,
                  onPress: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(CommandName.backColor,
                            getColorValue(Colors.greenAccent)));
                  },
                ),
                ColorMenu(
                  fillColor: Colors.lightBlue,
                  onPress: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(CommandName.backColor,
                            getColorValue(Colors.lightBlue)));
                  },
                ),
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
                  CommandManager.createCheckExecCommand());
            },
            selection: this.selection,
          ),
          Menu(
            tagName: TagName.I,
            icon: Icon(Icons.format_italic),
            iconSize: 32.0,
            tooltip: 'Increase volume by 10',
            onPressed: () {
              CommandManager.execCommand(widget.webviewController,
                  CommandManager.createExecCommand(CommandName.italic));

              CommandManager.execCommand(widget.webviewController,
                  CommandManager.createCheckExecCommand());
            },
            selection: this.selection,
          ),
          Menu(
            tagName: TagName.U,
            icon: Icon(Icons.format_underlined),
            iconSize: 32.0,
            tooltip: 'Increase volume by 10',
            onPressed: () {
              CommandManager.execCommand(widget.webviewController,
                  CommandManager.createExecCommand(CommandName.underline));

              CommandManager.execCommand(widget.webviewController,
                  CommandManager.createCheckExecCommand());
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
                  CommandManager.createExecCommand(CommandName.strikeThrough));

              CommandManager.execCommand(widget.webviewController,
                  CommandManager.createCheckExecCommand());
            },
            selection: this.selection,
          ),
          ExpandMenu(
              position: widget.position,
              icon: Icon(Icons.format_align_justify),
              iconSize: 32.0,
              tooltip: 'Increase volume by 10',
              menus: [
                Menu(
                  tagName: TagName.LEFT,
                  icon: Icon(Icons.format_align_left),
                  iconSize: 32.0,
                  tooltip: 'Increase volume by 10',
                  onPressed: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(
                            CommandName.justifyLeft));

                    CommandManager.execCommand(widget.webviewController,
                        CommandManager.createCheckExecCommand());
                  },
                  selection: this.selection,
                ),
                Menu(
                  tagName: TagName.CENTER,
                  icon: Icon(Icons.format_align_center),
                  iconSize: 32.0,
                  tooltip: 'Increase volume by 10',
                  onPressed: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(
                            CommandName.justifyCenter));

                    CommandManager.execCommand(widget.webviewController,
                        CommandManager.createCheckExecCommand());
                  },
                  selection: this.selection,
                ),
                Menu(
                  tagName: TagName.RIGHT,
                  icon: Icon(Icons.format_align_right),
                  iconSize: 32.0,
                  tooltip: 'Increase volume by 10',
                  onPressed: () {
                    CommandManager.execCommand(
                        widget.webviewController,
                        CommandManager.createExecCommand(
                            CommandName.justifyRight));

                    CommandManager.execCommand(widget.webviewController,
                        CommandManager.createCheckExecCommand());
                  },
                  selection: this.selection,
                ),
              ]),
        ],
      ),
    );
  }
}
