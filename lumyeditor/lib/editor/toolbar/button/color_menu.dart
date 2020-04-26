import 'package:flutter/material.dart';

class ColorMenu extends StatelessWidget {
  final double width;
  final double height;
  final Color borderColor;
  final Color fillColor;
  final Function onPress;

  const ColorMenu(
      {Key key,
      this.width = 36,
      this.height = 36,
      this.borderColor = Colors.black45,
      @required this.fillColor,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPress != null) {
          this.onPress();
        }
      },
      child: Container(
        width: this.width,
        height: this.height,
        child: Container(
          width: this.width - 2,
          height: this.height - 2,
          decoration: BoxDecoration(color: this.fillColor),
        ),
        margin: const EdgeInsets.only(left: 4),
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: this.borderColor)),
      ),
    );
  }
}
