import 'package:lumyeditor/utils/util.dart';

/// [TagName] used in seperating the kind of ui and html node
enum TagName {
  FONT,
  B,
  I,
  U,
  STRIKE,
  LEFT,
  CENTER,
  RIGHT,
  BACKCOLOR,
  FORECOLOR
}

/// [SelectionInfo]
class SelectionInfo {
  final String selectionTags;

  SelectionInfo(this.selectionTags);

  bool contains(TagName tag) {
    final String tagName = enumToString(tag);
    List<String> tags = selectionTags.split(',');

    for (int index = 0; index < tags.length; index++) {
      if (tags[index] == tagName) {
        return true;
      }
    }

    return false;
  }
}
