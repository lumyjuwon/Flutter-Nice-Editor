import 'package:flutter/material.dart';
import 'package:lumyeditor/editor/editor.dart';

void main() => runApp(DearEditorApp());

class DearEditorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DearEditorPage(title: 'Dear Editor'),
    );
  }
}

class DearEditorPage extends StatefulWidget {
  DearEditorPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DearEditorPageState createState() => _DearEditorPageState();
}

class _DearEditorPageState extends State<DearEditorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {},
            )
          ],
        ),
        body: Editor(position: Position.Top));
  }
}
