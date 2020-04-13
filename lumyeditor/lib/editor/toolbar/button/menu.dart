import 'package:flutter/material.dart';

import 'package:lumyeditor/editor/content/selection_info.dart';

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

  const Menu({
    @required this.icon,
    @required this.iconSize,
    this.tooltip,
    this.onPressed,
    @required this.tagName,
    this.selection,
    this.isChangableColor = true,
    this.unactiveColor = defaultUnactiveColor,
    this.activeColor = defaultActiveColor,
  }) : assert(onPressed != null);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Color _getColor() {
    print(widget.selection);
    print(widget.tagName.toString());

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

  @override
  void initState() {
    super.initState();
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
