import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'exec_command.dart';

// class ToolBar {
//   final WebView webView;
//   final WebViewController webViewController;

//   const ToolBar(this.webView, this.webViewController);

//   void execCommand(CommandName name,
//       [ShowDefaultUI showDefaultUI, ValueArgument argument]) {
//     final String command = createCommand(name, showDefaultUI, argument);
//     webViewController.evaluateJavascript(command);
//   }
// }

class Toolbar extends StatefulWidget {
  final WebViewController webViewController;
  Toolbar(this.webViewController) : super();

  @override
  _ToolbarState createState() => _ToolbarState();

  void execCommand(CommandName name, [bool showDefaultUI, String argument]) {
    final String command = createCommand(name, showDefaultUI, argument);
    webViewController.evaluateJavascript(command);
  }
}

class _ToolbarState extends State<Toolbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.format_size),
          iconSize: 32.0,
          tooltip: 'Increase volume by 10',
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.format_bold),
          iconSize: 32.0,
          tooltip: 'Increase volume by 10',
          onPressed: () {
            widget.execCommand(CommandName.bold);
          },
        )
      ],
    );
  }
}
