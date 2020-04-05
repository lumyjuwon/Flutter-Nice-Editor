import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:lumyeditor/editor/toolbar/commands.dart';
import 'package:lumyeditor/editor/toolbar/selection_info.dart';

/// [defaultUnactiveColor] is color that [Menu] is not activated
/// [defaultActiveColor] is color that [Menu] is actived
const Color defaultUnactiveColor = Color.fromARGB(0xFF, 0x00, 0x00, 0x00);
const Color defaultActiveColor = Color.fromARGB(0XFF, 0xF0, 0x3F, 0x2F);

class Menu extends StatefulWidget {
  final Icon icon;
  final double iconSize;
  final String tooltip;
  final Function onPressed;
  final TagName tagName;
  final SelectionInfo selection;

  final bool isChangableColor;
  final Color unactiveColor;
  final Color activeColor;

  final ExpandMenu expandMenu;

  const Menu(
      {this.icon,
      this.iconSize,
      this.tooltip,
      this.onPressed,
      this.tagName,
      this.selection,
      this.isChangableColor = true,
      this.unactiveColor = defaultUnactiveColor,
      this.activeColor = defaultActiveColor,
      this.expandMenu})
      : assert(onPressed != null || expandMenu != null);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final FlutterWebviewPlugin flutterWebviewPlugin = new FlutterWebviewPlugin();
  bool isFocus = false;

  Color _getColor() {
    if (widget.isChangableColor) {
      if (widget.selection == null) {
        return widget.unactiveColor;
      }

      if (widget.selection.contains(widget.tagName)) {
        return widget.activeColor;
      }
    }
    return widget.unactiveColor;
  }

  void _focusButton() {
    this
        .flutterWebviewPlugin
        .evalJavascript(createGetExecCommand(widget.tagName));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      IconButton(
        // focusNode: _focusNode,
        icon: widget.icon,
        iconSize: widget.iconSize,
        onPressed: () {
          if (widget.expandMenu != null) {
          } else {
            widget.onPressed();
          }
          this._focusButton();
        },
        tooltip: widget.tooltip,
        color: this._getColor(),
      ),
    ]);
    // return IconButton(
    //   // focusNode: _focusNode,
    //   icon: widget.icon,
    //   iconSize: widget.iconSize,
    //   onPressed: () {
    //     if (widget.expandMenu != null) {
    //     } else {
    //       widget.onPressed();
    //     }
    //   },
    //   tooltip: widget.tooltip,
    //   color: this._getColor(),
    // );
  }
}

class ExpandMenu extends StatefulWidget {
  final List<Menu> menus;

  const ExpandMenu(this.menus);

  @override
  _ExpandMenuState createState() => _ExpandMenuState();
}

class _ExpandMenuState extends State<ExpandMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          child: Menu(
            tagName: TagName.B,
            icon: Icon(Icons.format_bold),
            iconSize: 32.0,
            tooltip: 'Increase volume by 10',
          ),
        ),
      ),
    );
  }
}
