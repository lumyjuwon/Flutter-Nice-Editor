import 'package:lumyeditor/utils/enum.dart';

enum TagName { FONT, B, STRIKE }

/// [SelectionInfo]
class SelectionInfo {
  final String selectionTags;

  SelectionInfo(this.selectionTags);

  bool contains(TagName tagName) {
    final String _tagName = enumToString(tagName);
    return selectionTags.contains(_tagName);
  }
}
