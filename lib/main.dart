import 'package:flutter/material.dart';
import 'package:jspaste_mobile/components/button.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber)),
      home: const Scaffold(
        body: Center(
          child: Placeholder(),
        ),
        bottomNavigationBar: JSPasteBottomBar(),
      ),
    );
  }
}

class JSPasteBottomBar extends StatelessWidget {
  const JSPasteBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          BottomAppBarButton(
            icon: Icons.abc /* placeholder for JSPaste logo */,
            onTap: () {
              print("jspaste logo pressed");
            }
          ),
            const SizedBox(width: 10),
          const Text('[Placeholder]'),
          const Spacer(),
          BottomAppBarButton(
            icon: Icons.save,
            onTap: () {
              print("save pressed");
            },
          ),
        ],
      ),
    );
  }
}
