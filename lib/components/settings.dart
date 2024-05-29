import 'package:flutter/material.dart';
import 'package:jspaste_mobile/components/language_selector.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Column(
        children: [
          Text("Language"),
          SizedBox(height: 10),
          LanguageSelectorBox(),
        ],
      ),
    );
  }
}

