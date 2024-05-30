import 'package:flutter/material.dart';

class BottomAppBarButton extends StatefulWidget {
  final double height;
  final IconData icon;
  final VoidCallback onTap;

  const BottomAppBarButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.height = 50,
  });

  @override
  State<BottomAppBarButton> createState() => _BottomAppBarButtonState();
}

class _BottomAppBarButtonState extends State<BottomAppBarButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: widget.height,
        child: AspectRatio(
          aspectRatio: 1,
          child: Button(
            onTap: widget.onTap,
            child: Center(
              child: Icon(
                widget.icon,
                color: Colors.grey[850],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Button extends StatefulWidget {
  // child
  final Widget child;
  final VoidCallback onTap;

  const Button({super.key, required this.child, required this.onTap});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {
  late AnimationController _hoverController;
  late AnimationController _clickController;
  late Animation<Color?> _backgroundColor;
  final Color _defaultColor = Colors.white;
  final Color _hoverColor = Colors.amber[200]!;
  final Color _clickColor = Colors.amber;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _clickController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _backgroundColor = ColorTween(begin: _defaultColor, end: _hoverColor)
        .animate(_hoverController);
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _clickController.dispose();
    super.dispose();
  }

  void _onEnter(event) {
    // handle hover controller
    if (!_hoverController.isAnimating) {
      _hoverController.forward();
    }
  }

  void _onExit(event) {
    // handle hover controller
    if (_hoverController.isCompleted || _hoverController.isAnimating) {
      _hoverController.reverse();
    }

    // handle click controller
    if (_clickController.isAnimating || _clickController.isCompleted) {
      _clickController.reverse().then((value) {
        _backgroundColor = ColorTween(begin: _defaultColor, end: _hoverColor)
            .animate(_hoverController);
        _hoverController.reverse();
      });
    }
  }

  void _onTapDown(TapDownDetails details) {
    _backgroundColor =
        ColorTween(begin: _backgroundColor.value, end: _clickColor)
            .animate(_clickController);
    _clickController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _clickController.reverse().then((value) {
      _backgroundColor = ColorTween(begin: _defaultColor, end: _hoverColor)
          .animate(_hoverController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: _onEnter,
        onExit: _onExit,
        child: GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTap: widget.onTap,
          child: AnimatedBuilder(
            animation: Listenable.merge([_backgroundColor, _clickController]),
            builder: (context, child) => Container(
              decoration: BoxDecoration(
                color: _backgroundColor.value,
                borderRadius: BorderRadius.circular(10),
              ),
              child: widget.child,
            ),
          ),
        ));
  }
}
