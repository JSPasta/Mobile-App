import 'package:flutter/material.dart';

class BottomAppBarButton extends StatefulWidget {
  final double height;
  final IconData icon;
  final VoidCallback onTap;

  const BottomAppBarButton({super.key, required this.onTap, required this.icon, this.height = 50});

  @override
  State<BottomAppBarButton> createState() => _BottomAppBarButtonState();
}

class _BottomAppBarButtonState extends State<BottomAppBarButton>
    with TickerProviderStateMixin {
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
      onEnter: (event) => _hoverController.forward(),
      onExit: (event) {
        if (_hoverController.isCompleted) {
          _hoverController.reverse();
        }

        if (_clickController.isAnimating || _clickController.isCompleted) {
          _clickController.reverse().then((value) {
            _backgroundColor =
                ColorTween(begin: _defaultColor, end: _hoverColor)
                    .animate(_hoverController);
            _hoverController.reverse();
          });
        }
      },
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: Listenable.merge([_backgroundColor, _clickController]),
          builder: (context, child) => SizedBox(
            height: widget.height,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: _backgroundColor.value,
                  borderRadius: BorderRadius.circular(widget.height / 5),
                ),
                child: Center(
                  child: Icon(widget.icon, color: Colors.grey[850]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
