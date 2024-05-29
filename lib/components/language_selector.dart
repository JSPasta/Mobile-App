import 'package:flutter/material.dart';

class LanguageSelectorBox extends StatefulWidget {
  const LanguageSelectorBox({super.key});

  @override
  State<LanguageSelectorBox> createState() => _LanguageSelectorBoxState();
}

class _LanguageSelectorBoxState extends State<LanguageSelectorBox>
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
        if (_hoverController.isCompleted || _hoverController.isAnimating) {
          _hoverController.reverse();
        }

        if (_clickController.isCompleted || _clickController.isAnimating) {
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
        onTap: () {
          throw UnimplementedError(); // TODO: Implement ontap to show dialog
        },
        child: AnimatedBuilder(
          animation: Listenable.merge([_backgroundColor, _clickController]),
          builder: (context, child) => SizedBox(
            height: 40,
            child: Container(
              decoration: BoxDecoration(
                color: _backgroundColor.value,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: SizedBox(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LanguageSelectorDialog extends StatefulWidget {
  const LanguageSelectorDialog({super.key});

  @override
  State<LanguageSelectorDialog> createState() => _LanguageSelectorDialogState();
}

class _LanguageSelectorDialogState extends State<LanguageSelectorDialog> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
