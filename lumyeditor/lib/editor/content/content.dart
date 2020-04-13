import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lumyeditor/editor/content/channel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Content extends StatefulWidget {
  final ValueNotifier selectionListener;
  final Function initController;

  Content({@required this.selectionListener, @required this.initController})
      : super();

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> with WidgetsBindingObserver {
  void _loadHtmlFromAssets(WebViewController webViewController) async {
    String fileText = await rootBundle.loadString('assets/editor.html');
    webViewController.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());

    String jsText = await rootBundle.loadString('assets/selection.js');
    webViewController.evaluateJavascript(jsText);
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: null,
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels: [selectionChannel(widget.selectionListener)].toSet(),
      onWebViewCreated: (WebViewController controller) {
        widget.initController(controller);
        _loadHtmlFromAssets(controller);
      },
    );
  }
}
