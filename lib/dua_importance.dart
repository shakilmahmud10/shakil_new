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

class DuaImportance extends StatefulWidget {
  const DuaImportance({super.key});

  @override
  State<DuaImportance> createState() => _DuaImportanceState();
}

class _DuaImportanceState extends State<DuaImportance> {
  int? expandedIndex;

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
                MaterialPageRoute(builder: (context) => DuaImportanceDetails()),
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
                    // Item 1
                    _ExpandableItem(
                      number: 1,
                      title: 'The servant is dependent on his Lord',
                      subtitle: 'Total 15 Duas',
                      bullets: const [
                        'Sincerity',
                        'Eating Lawful Food',
                        'The Consciousness of One\'s Heart',
                        'Supplicate for Good Only',
                      ],
                      isExpanded: expandedIndex == 1,
                      onTap: () {
                        setState(() {
                          expandedIndex = expandedIndex == 1 ? null : 1;
                        });
                      },
                    ),
                    SizedBox(height: expandedIndex == 1 ? 22 : 20),

                    // Item 2
                    _ExpandableItem(
                      number: 2,
                      title: 'The most important thing to ask Allah for',
                      subtitle: 'Total 15 Duas',
                      bullets: const [
                        'Sincerity',
                        'Eating Lawful Food',
                        'The Consciousness of One\'s Heart',
                        'Supplicate for Good Only',
                      ],
                      isExpanded: expandedIndex == 2,
                      onTap: () {
                        setState(() {
                          expandedIndex = expandedIndex == 2 ? null : 2;
                        });
                      },
                    ),
                    SizedBox(height: expandedIndex == 2 ? 22 : 28),

                    // Item 3
                    _ExpandableItem(
                      number: 3,
                      title: 'Ask for paradise & protection from fire',
                      subtitle: 'Total 15 Duas',
                      bullets: const [
                        'Sincerity',
                        'Eating Lawful Food',
                        'The Consciousness of One\'s Heart',
                        'Supplicate for Good Only',
                      ],
                      isExpanded: expandedIndex == 3,
                      onTap: () {
                        setState(() {
                          expandedIndex = expandedIndex == 3 ? null : 3;
                        });
                      },
                    ),
                    SizedBox(height: expandedIndex == 3 ? 22 : 28),

                    // Item 4
                    _ExpandableItem(
                      number: 4,
                      title: 'Dua to remain steadfast on the religion',
                      subtitle: 'Total 15 Duas',
                      bullets: const [
                        'Sincerity',
                        'Eating Lawful Food',
                        'The Consciousness of One\'s Heart',
                        'Supplicate for Good Only',
                      ],
                      isExpanded: expandedIndex == 4,
                      onTap: () {
                        setState(() {
                          expandedIndex = expandedIndex == 4 ? null : 4;
                        });
                      },
                    ),
                    SizedBox(height: expandedIndex == 4 ? 22 : 28),

                    // Item 5
                    _ExpandableItem(
                      number: 5,
                      title: 'Dua of good outcome in all deeds',
                      subtitle: 'Total 15 Duas',
                      bullets: const [
                        'Sincerity',
                        'Eating Lawful Food',
                        'The Consciousness of One\'s Heart',
                        'Supplicate for Good Only',
                      ],
                      isExpanded: expandedIndex == 5,
                      onTap: () {
                        setState(() {
                          expandedIndex = expandedIndex == 5 ? null : 5;
                        });
                      },
                    ),
                    SizedBox(height: expandedIndex == 5 ? 22 : 28),

                    // Item 6
                    _ExpandableItem(
                      number: 6,
                      title: 'Seeking whatever good Allah can bestow',
                      subtitle: 'Total 15 Duas',
                      bullets: const [
                        'Sincerity',
                        'Eating Lawful Food',
                        'The Consciousness of One\'s Heart',
                        'Supplicate for Good Only',
                      ],
                      isExpanded: expandedIndex == 6,
                      onTap: () {
                        setState(() {
                          expandedIndex = expandedIndex == 6 ? null : 6;
                        });
                      },
                    ),
                    SizedBox(height: expandedIndex == 6 ? 22 : 28),

                    // Item 7
                    _ExpandableItem(
                      number: 7,
                      title:
                          'Shelter from horror, misery, evil consequences and rejoicing of the enemy',
                      subtitle: 'Total 15 Duas',
                      bullets: const [
                        'Sincerity',
                        'Eating Lawful Food',
                        'The Consciousness of One\'s Heart',
                        'Supplicate for Good Only',
                      ],
                      isExpanded: expandedIndex == 7,
                      onTap: () {
                        setState(() {
                          expandedIndex = expandedIndex == 7 ? null : 7;
                        });
                      },
                    ),
                    SizedBox(height: expandedIndex == 7 ? 22 : 28),

                    // Item 8
                    _ExpandableItem(
                      number: 8,
                      title: 'Dua to remain steadfast on the religion',
                      subtitle: 'Total 15 Duas',
                      bullets: const [
                        'Sincerity',
                        'Eating Lawful Food',
                        'The Consciousness of One\'s Heart',
                        'Supplicate for Good Only',
                      ],
                      isExpanded: expandedIndex == 8,
                      onTap: () {
                        setState(() {
                          expandedIndex = expandedIndex == 8 ? null : 8;
                        });
                      },
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

class _ExpandableItem extends StatelessWidget {
  const _ExpandableItem({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.bullets,
    required this.isExpanded,
    required this.onTap,
  });

  final int number;
  final String title;
  final String subtitle;
  final List<String> bullets;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (isExpanded) {
      return Semantics(
        container: true,
        label: 'Expanded subcategory $number: $title',
        child: Container(
          decoration: BoxDecoration(
            color: kCardAndSearchBackground3,
            borderRadius: BorderRadius.circular(20),
            border: Border(bottom: BorderSide(color: kBulletColor, width: 0.3)),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 10),
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
        ),
      );
    } else {
      return InkWell(
        onTap: onTap,
        child: Semantics(
          label: 'Subcategory $number: $title. $subtitle.',
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Number badge (white circle with subtle ring)
              Padding(
                padding: const EdgeInsets.only(top: 5),
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
                          fontSize: 16,
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
        ),
      );
    }
  }

  Widget _bulletRow(String text) {
    return Semantics(
      label: text,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: 24,
                width: 24,
                child: Image.asset(kbulletIcon1, width: 16, height: 16),
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
      ),
    );
  }
}
