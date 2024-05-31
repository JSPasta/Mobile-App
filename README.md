# JSPaste mobile app

Abandoned project because of no maintained flutter packages for a code editor.

## Current state

The app can be compiled and can be started, however (on Windows) no window is shown, except if you remove the widget `CodeEditor` from the `main.dart` file. The error that shows up is:

```bash
════════ Exception caught by foundation library ════════════════════════════════
The following assertion was thrown while dispatching notifications for CodeController:
ScrollController not attached to any scroll views.
'package:flutter/src/widgets/scroll_controller.dart':
Failed assertion: line 157 pos 12: '_positions.isNotEmpty'

When the exception was thrown, this was the stack:
#2      ScrollController.position (package:flutter/src/widgets/scroll_controller.dart:157:12)
#3      _LinkedScrollController.position (package:linked_scroll_controller/linked_scroll_controller.dart:165:47)
#4      ScrollController.offset (package:flutter/src/widgets/scroll_controller.dart:165:24)
#5      _CodeFieldState._onTextChanged (package:flutter_code_editor/src/code_field/code_field.dart:333:47)
#6      ChangeNotifier.notifyListeners (package:flutter/src/foundation/change_notifier.dart:433:24)
#7      CodeController.analyzeCode (package:flutter_code_editor/src/code_field/code_controller.dart:224:5)
<asynchronous suspension>
(elided 2 frames from class _AssertionError)

The CodeController sending notification was: CodeController#a22b3(TextEditingValue(text: ┤void main() {
  print("Hello, World!");
}├, selection: TextSelection.invalid, composing: TextRange(start: -1, end: -1)))
════════════════════════════════════════════════════════════════════════════════
```

Issues are opened on the flutter_code_editor repository, but no response from the maintainer: https://github.com/akvelon/flutter-code-editor/issues/201.

## Possible solutions to investigate

- Use a different code editor package (e.g. https://pub.dev/packages/code_editor, but it is inactive too)
- Explore solutions like [this](https://github.com/akvelon/flutter-code-editor/issues/201#issuecomment-1918354855).

