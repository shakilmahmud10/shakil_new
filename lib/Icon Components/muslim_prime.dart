import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Core Components/colors.dart';
import '../Core Components/images.dart';

class MuslimPrime extends StatelessWidget {
  const MuslimPrime({super.key});

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
          'Muslim Prime',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: kTextDark,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Prime Card hobe
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.15,
                  children: const [
                    PrimeCard(
                      title: 'Quran Majeed',
                      svgAssetPath: primeCard1,
                      bottom: 0,
                      right: 0,
                    ),
                    PrimeCard(
                      title: 'Al Hadith',
                      svgAssetPath: primeCard2,
                      bottom: -10,
                      right: 12.0,
                    ),
                    PrimeCard(
                      title: 'Dua & Ruqyah',
                      svgAssetPath: primeCard3,
                      bottom: 0,
                      right: 5,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  // crossAxisSpacing: 8,
                  // mainAxisSpacing: 8,
                  childAspectRatio: .95,
                  children: const [
                    PrayerAndOthersCard(icon: primeIcon1, text: 'Last'),
                    PrayerAndOthersCard(icon: primeIcon2, text: 'Tasbih'),
                    PrayerAndOthersCard(icon: primeIcon3, text: 'Calender'),
                    PrayerAndOthersCard(icon: primeIcon4, text: 'Qibla'),
                    PrayerAndOthersCard(icon: primeIcon5, text: 'Sihr'),
                    PrayerAndOthersCard(icon: primeIcon6, text: 'Salah'),
                    PrayerAndOthersCard(icon: primeIcon7, text: '99 Names'),
                    PrayerAndOthersCard(icon: primeIcon8, text: 'Hazz'),
                    PrayerAndOthersCard(icon: primeIcon9, text: 'Halal'),
                    PrayerAndOthersCard(icon: primeIcon10, text: 'Mosque'),
                    PrayerAndOthersCard(icon: primeIcon11, text: 'Siyam'),
                    PrayerAndOthersCard(icon: primeIcon12, text: 'Zakat'),
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

class PrayerAndOthersCard extends StatelessWidget {
  final String icon;
  final String text;
  final Color? iconBGColor;

  const PrayerAndOthersCard({
    super.key,
    required this.icon,
    required this.text,
    this.iconBGColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: iconBGColor,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular icon holder
          Container(
            width: 55,
            height: 55,
            alignment: Alignment.center,
            child: SvgPicture.asset(icon, height: 40, width: 40),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: kTextColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class PrimeCard extends StatelessWidget {
  final String title;
  final Color cardBGColor;
  final String? svgAssetPath;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const PrimeCard({
    super.key,
    required this.title,
    this.cardBGColor = qPrimeCardBG, // Default: green
    this.svgAssetPath,
    this.top,
    this.bottom,
    this.left,
    this.right,
  }) : assert(
         svgAssetPath == null ||
             top != null ||
             bottom != null ||
             left != null ||
             right != null,
         'If svgAssetPath is provided, you must provide at least one positional argument (top, bottom, left, right)',
       );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 112,
      // width: 118,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: cardBGColor,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
          ),

          Positioned(
            top: 10,
            left: 10,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if (svgAssetPath != null)
            Positioned(
              top: top,
              bottom: bottom,
              left: left,
              right: right,
              child: SvgPicture.asset(
                svgAssetPath!,
                height: 60,
                width: 60,
                // colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
        ],
      ),
    );
  }
}
