import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/dart.dart';

final controller = CodeController(
  text: 'void main() {\n  print("Hello, World!");\n}',
  language: dart,
);

class CodeEditor extends StatelessWidget {
  const CodeEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return CodeTheme(
      data: CodeThemeData(styles: monokaiSublimeTheme),
      child: SingleChildScrollView(
        child: CodeField(
          controller: controller,
          maxLines: null,
          minLines: 50,
        ),
      ),
    );
  }
}
