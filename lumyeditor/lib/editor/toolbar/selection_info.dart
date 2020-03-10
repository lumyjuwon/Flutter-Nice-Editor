import 'package:lumyeditor/editor/toolbar/menu.dart';
import 'package:lumyeditor/utils/enum.dart';

class SelectionInfo {
  final String selectionTags;

  SelectionInfo(this.selectionTags);

  bool contains(TagName tagName) {
    final String _tagName = enumToString(tagName);
    return selectionTags.contains(_tagName);
  }
}
