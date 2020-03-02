import 'package:flutter/material.dart';

enum MenuName { font, bold }

class Menu extends StatefulWidget {
  final Icon icon;
  final double iconSize;
  final String tooltip;
  final Function onPress;

  final bool isChangableColor = true;
  final String changeColor = '#958451';

  Menu(this.icon, this.iconSize, this.tooltip, this.onPress);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
