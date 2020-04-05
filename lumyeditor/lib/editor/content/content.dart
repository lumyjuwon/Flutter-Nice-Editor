import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'channel.dart';

class Content extends StatefulWidget {
  final FlutterWebviewPlugin webviewPlugin;
  final ValueNotifier selectionListener;

  Content({this.webviewPlugin, this.selectionListener}) : super();

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> with WidgetsBindingObserver {
  void _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('assets/editor.html');
    widget.webviewPlugin.reloadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
    _loadHtmlFromAssets();
  }

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: null,
      withJavascript: true,
      withLocalUrl: true,
      allowFileURLs: true,
      javascriptChannels: [selectionChannel(widget.selectionListener)].toSet(),
    );
  }
}
