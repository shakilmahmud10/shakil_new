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

  void _toggle(int number) {
    setState(() {
      _expandedNumber = _expandedNumber == number ? null : number;
    });
  }

  Widget _buildTile({
    required int number,
    required String title,
    required String subtitle,
    required List<String> bullets,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _toggle(number),
      child: _animatedTile(
        expanded: _expandedNumber == number,
        collapsed: _CollapsedItem(
          number: number,
          title: title,
          subtitle: subtitle,
        ),
        expandedChild: _ExpandedCardItem(
          number: number,
          title: title,
          subtitle: subtitle,
          bullets: bullets,
        ),
      ),
    );
  }

  AnimatedCrossFade _animatedTile({
    required bool expanded,
    required Widget collapsed,
    required Widget expandedChild,
  }) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 500),
      firstCurve: Curves.easeInOut,
      secondCurve: Curves.easeInOut,
      sizeCurve: Curves.easeInOut,
      crossFadeState: expanded
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      firstChild: collapsed,
      secondChild: expandedChild,
      alignment: Alignment.topCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
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

    const bullets = [
      'Sincerity',
      'Eating Lawful Food',
      'The Consciousness of One\'s Heart',
      'Supplicate for Good Only',
    ];

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
              kSearchBar(hintText: 'Search by Subcategories Name'),
              const SizedBox(height: 22),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(5),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 22),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _buildTile(
                      number: item['number'] as int,
                      title: item['title'] as String,
                      subtitle: item['subtitle'] as String,
                      bullets: bullets,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Semantics(
        label: 'Subcategory $number: $title. $subtitle.',
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
                style: const TextStyle(
                  color: kPrimaryGreen,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                        color: kPureBlack,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: const TextStyle(
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
          color: kCardAndSearchBackground3,
          borderRadius: BorderRadius.circular(20),
          border: Border(bottom: BorderSide(color: kBulletColor, width: 0.3)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              Container(
                height: 1,
                margin: const EdgeInsets.symmetric(horizontal: 18),
                color: kRingColor.withOpacity(0.8),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
                child: Column(
                  children: bullets
                      .map(
                        (text) => Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: _bulletRow(text),
                        ),
                      )
                      .toList(),
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
