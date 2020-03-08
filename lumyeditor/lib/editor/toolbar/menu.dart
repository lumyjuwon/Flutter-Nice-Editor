import 'package:flutter/material.dart';
import 'package:lumyeditor/editor/toolbar/selection_info.dart';

enum TagName { FONT, B, STRIKE }

const Color defaultColor = Color.fromARGB(0xFF, 0x00, 0x00, 0x00);

class Menu extends StatefulWidget {
  final Icon icon;
  final double iconSize;
  final String tooltip;
  final Function onPressed;
  final TagName tagName;
  final SelectionInfo selection;

  final bool isChangableColor = true;
  final int changedColor = 0xFFF03F2F;

  const Menu(
      {this.icon,
      this.iconSize,
      this.tooltip,
      this.onPressed,
      this.tagName,
      this.selection});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Color _getColor() {
    if (widget.isChangableColor) {
      print(widget.selection.contains(widget.tagName));
      if (widget.selection.contains(widget.tagName)) {
        return Color.fromARGB(0XFF, 0xF0, 0x3F, 0x2F);
      }
      return defaultColor;
    }
    return defaultColor;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: widget.icon,
      iconSize: widget.iconSize,
      onPressed: () {
        widget.onPressed();
      },
      tooltip: widget.tooltip,
      color: this._getColor(),
    );
  }
}
