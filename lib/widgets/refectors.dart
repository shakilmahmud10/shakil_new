import 'package:flutter/material.dart';
import 'colors.dart';

class kSearchBar extends StatelessWidget {
  final String hintText;

  const kSearchBar({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kCardBackground,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: kMutedGreen.withOpacity(0.3)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.search, color: Color(0xB32F6B5E), size: 26),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xFF8FA397),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: TextStyle(fontSize: 16, color: kTextDark),
            ),
          ),
        ],
      ),
    );
  }
}
