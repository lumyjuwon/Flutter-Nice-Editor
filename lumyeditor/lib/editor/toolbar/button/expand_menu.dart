import 'package:flutter/material.dart';

import 'package:lumyeditor/editor/editor.dart';

OverlayEntry overlayEntry;
OverlayState overlayState;
final Map<int, bool> overlayParentWidget = {};

OverlayEntry createOverlayEntry(
    BuildContext context, Position position, List<Widget> menus) {
  RenderBox renderBox = context.findRenderObject();
  Size size = renderBox.size;
  Offset offset = renderBox.localToGlobal(Offset.zero);

  return OverlayEntry(
      builder: (context) => Positioned(
          left: offset.dx,
          top: position == Position.Top
              ? offset.dy + size.height
              : offset.dy - size.height,
          child: Material(
            child: Row(
              children: menus,
            ),
          )));
}

void showOverlay(BuildContext context, Position position, List<Widget> menus) {
  overlayState = Overlay.of(context);
  overlayEntry = createOverlayEntry(context, position, menus);
  overlayState.insert(overlayEntry);
}

void closeOverlay() {
  if (overlayEntry != null) {
    overlayEntry.remove();
    overlayEntry = null;
  }
}

class ExpandMenu extends StatefulWidget {
  final Position position;
  final Icon icon;
  final double iconSize;
  final String tooltip;
  final List<Widget> menus;

  const ExpandMenu({
    Key key,
    this.position,
    this.icon,
    this.iconSize,
    this.tooltip,
    this.menus,
  }) : super(key: key);

  @override
  _ExpandMenuState createState() => _ExpandMenuState();
}

class _ExpandMenuState extends State<ExpandMenu> {
  int contextHashCode;

  @override
  void initState() {
    super.initState();

    contextHashCode = context.hashCode;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: widget.icon,
      iconSize: widget.iconSize,
      onPressed: () {
        assert(overlayParentWidget.length <= 1);

        if (overlayParentWidget.containsKey(contextHashCode)) {
          if (overlayParentWidget[contextHashCode]) {
            closeOverlay();
          } else {
            showOverlay(context, widget.position, widget.menus);
          }
          overlayParentWidget[contextHashCode] =
              !overlayParentWidget[contextHashCode];
        } else {
          closeOverlay();
          showOverlay(context, widget.position, widget.menus);

          overlayParentWidget.clear();
          overlayParentWidget.addAll({contextHashCode: true});
        }
      },
    );
  }
}
