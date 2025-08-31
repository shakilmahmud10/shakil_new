// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:shakil_new/widgets/refectors.dart';
import 'dua_importance_details.dart';
import 'widgets/colors.dart';
import 'widgets/style.dart';
import 'widgets/images.dart';

void main() {
  runApp(const DuaImportance());
}

class DuaImportance extends StatelessWidget {
  const DuaImportance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPureWhite,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kPrimaryGreen),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Dua Importance',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: kTextDark,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DuaImportanceApp()),
              );
            },
            icon: Icon(Icons.arrow_forward, color: kPrimaryGreen),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search
              kSearchBar(hintText: 'Search by Subcategories Name'),

              const SizedBox(height: 22),

              // List
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(5),
                  children: [
                    // Item 1 (collapsed)
                    _CollapsedItem(
                      number: 1,
                      title: 'The servant is dependent on his Lord',
                      subtitle: 'Total 15 Duas',
                    ),
                    const SizedBox(height: 18),

                    // Item 2 (expanded card)
                    _ExpandedCardItem(
                      number: 2,
                      title: 'The most important thing to ask Allah for',
                      subtitle: 'Total 15 Duas',
                      bullets: const [
                        'Sincerity',
                        'Eating Lawful Food',
                        'The Consciousness of One\'s Heart',
                        'Supplicate for Good Only',
                      ],
                    ),
                    const SizedBox(height: 22),

                    // Item 3..6 (collapsed)
                    _CollapsedItem(
                      number: 3,
                      title: 'Ask for paradise & protection from fire',
                      subtitle: 'Total 15 Duas',
                    ),
                    const SizedBox(height: 22),
                    _CollapsedItem(
                      number: 4,
                      title: 'Dua to remain steadfast on the religion',
                      subtitle: 'Total 15 Duas',
                    ),
                    const SizedBox(height: 22),
                    _CollapsedItem(
                      number: 5,
                      title: 'Dua of good outcome in all deeds',
                      subtitle: 'Total 15 Duas',
                    ),
                    const SizedBox(height: 22),
                    _CollapsedItem(
                      number: 6,
                      title: 'Seeking whatever good Allah can bestow',
                      subtitle: 'Total 15 Duas',
                    ),
                    const SizedBox(height: 22),
                    _CollapsedItem(
                      number: 7,
                      title:
                          'Shelter from horror, misery, evil consequences and rejoicing of the enemy',
                      subtitle: 'Total 15 Duas',
                    ),
                    const SizedBox(height: 22),
                    _CollapsedItem(
                      number: 8,
                      title: 'Dua to remain steadfast on the religion',
                      subtitle: 'Total 15 Duas',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CollapsedItem extends StatelessWidget {
  const _CollapsedItem({
    required this.number,
    required this.title,
    required this.subtitle,
  });

  final int number;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Subcategory $number: $title. $subtitle.',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Number badge (white circle with subtle ring)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: kCardAndSearchBackground,
                shape: BoxShape.circle,
                border: Border.all(color: kRingColor, width: 2),
              ),
              alignment: Alignment.center,
              child: Text(
                '$number',
                style: TextStyle(
                  color: kPrimaryGreen,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      color: kPureBlack,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: kMutedGreen,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpandedCardItem extends StatelessWidget {
  const _ExpandedCardItem({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.bullets,
  });

  final int number;
  final String title;
  final String subtitle;
  final List<String> bullets;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: 'Expanded subcategory $number: $title',
      child: Container(
        decoration: BoxDecoration(
          color: kCardBackground,
          borderRadius: BorderRadius.circular(20),
          border: Border(
            bottom: BorderSide(
              color: kBulletColor, // border color
              width: 0.3, // border width
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Column(
            children: [
              // Header row
              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Active number badge (filled deep with thick soft ring)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: kPrimaryGreen,
                          shape: BoxShape.circle,
                          border: Border.all(color: kRingColor, width: 2),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '$number',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                                color: kPureBlack,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              subtitle,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.2,
                                color: kMutedGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Divider
              Container(
                height: 1,
                margin: const EdgeInsets.symmetric(horizontal: 18),
                color: kRingColor.withOpacity(0.8),
              ),

              // Bullet list
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
                child: Column(
                  children: [
                    _bulletRow('Sincerity'),
                    const SizedBox(height: 18),
                    _bulletRow('Eating Lawful Food'),
                    const SizedBox(height: 18),
                    _bulletRow('The Consciousness of One\'s Heart'),
                    const SizedBox(height: 18),
                    _bulletRow('Supplicate for Good Only'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bulletRow(String text) {
    return Semantics(
      label: text,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              height: 24,
              width: 24,
              child: Image.asset(
                'assets/images/png/bullet_icon1.png',
                width: 16,
                height: 16,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: kPureBlack,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
