import 'package:flutter/material.dart';
import 'package:jspaste_mobile/components/button.dart';
import 'package:simple_icons/simple_icons.dart';

class LanguageSelectorBox extends StatefulWidget {
  const LanguageSelectorBox({super.key});

  @override
  State<LanguageSelectorBox> createState() => _LanguageSelectorBoxState();
}

class _LanguageSelectorBoxState extends State<LanguageSelectorBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Button(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  SimpleIcons.rust,
                  color: Colors.grey[850],
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Rust (detected)',
                  style: TextStyle(
                    color: Colors.grey[850],
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();

            // TODO: Implement ontap to show dialog
          }),
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
