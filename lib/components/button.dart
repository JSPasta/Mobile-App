import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final double height;
  final Icon icon;

  const Button({super.key, required this.icon, this.height = 40});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _backgroundColor;
  final Color _defaultColor = Colors.white;
  final Color _hoverColor = Colors.amber[100]!;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _backgroundColor =
        ColorTween(begin: _defaultColor, end: _hoverColor).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => _controller.forward(),
      onExit: (event) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _backgroundColor,
        builder: (context, child) => SizedBox(
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: widget.height,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: _backgroundColor.value,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: IconTheme(
                  data: const IconThemeData(
                    color: Colors.amber,
                  ),
                  child: widget.icon,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
