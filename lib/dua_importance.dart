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
  int? _expandedNumber = 1;

  final items = [
    {
      'number': 1,
      'title': 'The servant is dependent on his Lord',
      'subtitle': 'Total 15 Duas',
    },
    {
      'number': 2,
      'title': 'The most important thing to ask Allah for',
      'subtitle': 'Total 15 Duas',
    },
    {
      'number': 3,
      'title': 'Ask for paradise & protection from fire',
      'subtitle': 'Total 15 Duas',
    },
    {
      'number': 4,
      'title': 'Dua to remain steadfast on the religion',
      'subtitle': 'Total 15 Duas',
    },
    {
      'number': 5,
      'title': 'Dua of good outcome in all deeds',
      'subtitle': 'Total 15 Duas',
    },
    {
      'number': 6,
      'title': 'Seeking whatever good Allah can bestow',
      'subtitle': 'Total 15 Duas',
    },
    {
      'number': 7,
      'title':
          'Shelter from horror, misery, evil consequences and rejoicing of the enemy',
      'subtitle': 'Total 15 Duas',
    },
    {
      'number': 8,
      'title': 'Dua to remain steadfast on the religion',
      'subtitle': 'Total 15 Duas',
    },
  ];

  final bullets = [
    'Sincerity',
    'Eating Lawful Food',
    'The Consciousness of One\'s Heart',
    'Supplicate for Good Only',
  ];

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
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kSearchBar(hintText: 'Search by Subcategories Name'),
              const SizedBox(height: 22),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(5),
                  itemCount: items.length,
                  separatorBuilder: (_, index) =>
                      SizedBox(height: _expandedNumber == index + 1 ? 16 : 20),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final number = item['number'] as int;
                    final isExpanded = _expandedNumber == number;

                    return Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                        listTileTheme: const ListTileThemeData(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                      child: Container(
                        decoration: isExpanded
                            ? BoxDecoration(
                                color: kCardAndSearchBackground3,
                                borderRadius: BorderRadius.circular(20),
                                border: Border(
                                  bottom: BorderSide(
                                    color: kBulletColor,
                                    width: 0.3,
                                  ),
                                ),
                              )
                            : null,
                        child: ExpansionTile(
                          key: ValueKey(number),
                          initiallyExpanded: isExpanded,
                          onExpansionChanged: (expanded) {
                            setState(() {
                              _expandedNumber = expanded ? number : null;
                            });
                          },
                          tilePadding: EdgeInsets.zero,
                          childrenPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          collapsedBackgroundColor: Colors.transparent,
                          iconColor: Colors.transparent,
                          collapsedIconColor: Colors.transparent,
                          trailing: const SizedBox.shrink(),
                          title: isExpanded
                              ? Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    18,
                                    18,
                                    18,
                                    0,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 16.0,
                                        ),
                                        child: Container(
                                          height: 36,
                                          width: 36,
                                          decoration: BoxDecoration(
                                            color: kPrimaryGreen,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: kRingColor,
                                              width: 2,
                                            ),
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
                                          padding: const EdgeInsets.only(
                                            top: 2,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item['title'] as String,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  height: 1.5,
                                                  fontWeight: FontWeight.w500,
                                                  color: kPureBlack,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                item['subtitle'] as String,
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
                                )
                              : Semantics(
                                  label:
                                      'Subcategory $number: ${item['title']}. ${item['subtitle']}.',
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Container(
                                          height: 36,
                                          width: 36,
                                          decoration: BoxDecoration(
                                            color: kCardAndSearchBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: kRingColor,
                                              width: 2,
                                            ),
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
                                          padding: const EdgeInsets.only(
                                            top: 2,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item['title'] as String,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  height: 1.5,
                                                  fontWeight: FontWeight.w500,
                                                  color: kPureBlack,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                item['subtitle'] as String,
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
                          children: isExpanded
                              ? [
                                  Container(
                                    height: 1,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                    ),
                                    color: kRingColor.withOpacity(0.8),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      18,
                                      16,
                                      18,
                                      18,
                                    ),
                                    child: Column(
                                      children: bullets.asMap().entries.map((
                                        entry,
                                      ) {
                                        int bulletIndex = entry.key;
                                        String bullet = entry.value;
                                        return Column(
                                          children: [
                                            _bulletRow(bullet),
                                            if (bulletIndex <
                                                bullets.length - 1)
                                              const SizedBox(height: 18),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ]
                              : [],
                        ),
                      ),
                    );
                  },
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
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
