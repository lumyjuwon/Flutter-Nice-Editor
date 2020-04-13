import 'package:flutter/material.dart';

import 'package:lumyeditor/editor/toolbar/button/menu.dart';
import 'package:lumyeditor/editor/editor.dart';

class ExpandMenu extends StatefulWidget {
  final Position position;
  final Icon icon;
  final double iconSize;
  final String tooltip;
  final List<Menu> menus;

  const ExpandMenu(
      {this.position, this.icon, this.iconSize, this.tooltip, this.menus});

  @override
  _ExpandMenuState createState() => _ExpandMenuState();
}

class _ExpandMenuState extends State<ExpandMenu> {
  OverlayEntry _overlayEntry;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
        builder: (context) => Positioned(
            left: offset.dx,
            top: widget.position == Position.Top
                ? offset.dy + size.height
                : offset.dy - size.height,
            child: Material(
              child: Row(
                children: widget.menus,
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: widget.icon,
      iconSize: widget.iconSize,
      onPressed: () {
        if (this._hasFocus) {
          this._overlayEntry.remove();
        } else {
          this._overlayEntry = _createOverlayEntry();
          Overlay.of(context).insert(this._overlayEntry);
        }

        this.setState(() {
          _hasFocus = !_hasFocus;
        });
      },
      tooltip: widget.tooltip,
    );
    // return Scaffold(
    //   body: Padding(
    //     padding: const EdgeInsets.all(50.0),
    //     child: Form(
    //       child: ListView(
    //         children: <Widget>[
    //           TextFormField(
    //             decoration: InputDecoration(labelText: 'Address'),
    //           ),
    //           SizedBox(
    //             height: 16.0,
    //           ),
    //           TextFormField(
    //             decoration: InputDecoration(labelText: 'City'),
    //           ),
    //           SizedBox(
    //             height: 16.0,
    //           ),
    //           TextFormField(
    //             decoration: InputDecoration(labelText: 'Address'),
    //           ),
    //           SizedBox(
    //             height: 16.0,
    //           ),
    //           RaisedButton(
    //             child: Text('SUBMIT'),
    //             onPressed: () {
    //               // submit the form
    //             },
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    // return Scaffold(
    //   body: Padding(
    //     padding: EdgeInsets.all(16.0),
    //     child: Form(
    //         child: Column(
    //       children: <Widget>[
    //         IconButton(
    //           icon: widget.icon,
    //           iconSize: widget.iconSize,
    //           onPressed: () {},
    //           tooltip: widget.tooltip,
    //         )
    //       ],
    //     )),
    //   ),
    // );
  }
}
