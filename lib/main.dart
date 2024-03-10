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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber)
      ),
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
    return const BottomAppBar(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Text('[Placeholder]'),
          Spacer(),
          Button(icon: Icon(Icons.save)),
        ],
      ),
    );
  }
}

class BottomBarButton extends StatelessWidget {
  final Icon icon;
  final double height;

  const BottomBarButton({
    super.key,
    required this.icon,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: 1,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            elevation: MaterialStateProperty.all(0),
            iconColor: MaterialStateProperty.all(Colors.amber),
            
          ),
          onPressed: () {},
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
