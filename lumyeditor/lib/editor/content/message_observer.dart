import 'package:flutter/cupertino.dart';

import 'package:lumyeditor/editor/content/selection_info.dart';

class SelectionObserver extends ValueNotifier<SelectionInfo> {
  SelectionObserver() : super(SelectionInfo(''));
}
