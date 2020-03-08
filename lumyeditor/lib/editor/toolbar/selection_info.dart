import 'package:lumyeditor/editor/toolbar/menu.dart';

class SelectionInfo {
  final String selectionTags;

  SelectionInfo(this.selectionTags);

  bool contains(TagName tagName) {
    final String _tagName = tagName.toString().split('.')[1];
    return selectionTags.contains(_tagName);
  }
}
