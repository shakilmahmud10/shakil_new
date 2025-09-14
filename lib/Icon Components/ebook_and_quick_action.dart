import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shakil_new/Icon%20Components/prayer_and_others.dart';
import '../widgets/colors.dart';
import '../widgets/images.dart';

class EbookAndQuickAction extends StatelessWidget {
  const EbookAndQuickAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPureWhite,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kPrimaryGreen),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Back',
        ),
        title: const Text(
          'Ebook & Quick Action',
          style: TextStyle(
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
                MaterialPageRoute(builder: (context) => PrayerAndOthers()),
              );
            },
            icon: const Icon(Icons.arrow_forward, color: kPrimaryGreen),
            tooltip: 'Next',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    mainAxisExtent: 68, // compact height like the mock
                  ),
                  children: const [
                    EbookCard(
                      title: 'Tafsir Books',
                      subtitle: '25 Books',
                      icon: eBookIcon1,
                      cardBGColor: lightPink,
                      accentColor: purePink,
                    ),
                    EbookCard(
                      title: 'History Books',
                      subtitle: '15 Books',
                      icon: eBookIcon2,
                      cardBGColor: lightOrange,
                      accentColor: pureOrange,
                    ),
                    EbookCard(
                      title: 'Art Books',
                      subtitle: '12 Books',
                      icon: eBookIcon3,
                      cardBGColor: lightBlue,
                      accentColor: pureBlue,
                    ),
                    EbookCard(
                      title: 'See All',
                      subtitle: '30 Categories',
                      icon: eBookIcon4,
                      cardBGColor: lightGreen,
                      accentColor: pureGreen,
                    ),
                  ],
                ),

                SizedBox(height: 30),

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: .9,
                  children: const [
                    AlHadithCard(icon: alhadithIcon1, text: 'Last'),
                    AlHadithCard(icon: alhadithIcon2, text: 'Hifz'),
                    AlHadithCard(icon: alhadithIcon3, text: 'Jump'),
                    AlHadithCard(icon: alhadithIcon4, text: 'Support'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AlHadithCard extends StatelessWidget {
  final String icon;
  final String text;
  final Color? iconBGColor;

  const AlHadithCard({
    super.key,
    required this.icon,
    required this.text,
    this.iconBGColor = const Color(0xFFF2F6F1),
  });

  @override
  Widget build(BuildContext context) {
    const Color cardBG = Color(0xFFEEF9F5);

    return Container(
      // height: 220,
      // width: 80,
      decoration: BoxDecoration(
        color: cardBG,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Circular icon holder
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            child: SvgPicture.asset(icon),
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500, color: kTextColor),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class EbookCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final Color? cardBGColor;
  final Color? accentColor;

  const EbookCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.cardBGColor = const Color(0xFFfff3e9),
    this.accentColor = const Color(0xFFf68420),
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      button: true,
      label: '$title, $subtitle',
      child: Container(
        decoration: BoxDecoration(
          color: cardBGColor,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SvgPicture.asset(icon),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF1B1B1F),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color(0xFF1B1B1F).withOpacity(0.55),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
