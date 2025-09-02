import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shakil_new/task2/muslim_prime.dart';
import '../widgets/colors.dart';
import '../widgets/images.dart';

class PrayerAndOthers extends StatelessWidget {
  const PrayerAndOthers({super.key});

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
          'Prayer & Others',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: kTextDark,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MuslimPrime()),
              );},
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
                Text(
                  'Prayer',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kTextLight,
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  // crossAxisSpacing: 8,
                  // mainAxisSpacing: 8,
                  childAspectRatio: 1.3,
                  children: const [
                    PrayerAndOthersCard(icon: prayer1, text: 'Quran Mazid'),
                    PrayerAndOthersCard(icon: prayer2, text: 'Dua & Ruqyah'),
                    PrayerAndOthersCard(icon: prayer3, text: 'Al Hadith'),
                    PrayerAndOthersCard(icon: prayer4, text: 'Musaf Mode'),
                    PrayerAndOthersCard(icon: prayer5, text: 'Masayel'),
                    PrayerAndOthersCard(icon: prayer6, text: 'Salah Tracker'),
                    PrayerAndOthersCard(icon: prayer7, text: '99 Names'),
                    PrayerAndOthersCard(icon: prayer8, text: 'Qibla Finder'),
                    PrayerAndOthersCard(icon: prayer9, text: 'Mosque Finder'),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Others',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kTextLight,
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  // crossAxisSpacing: 8,
                  // mainAxisSpacing: 8,
                  childAspectRatio: 1.3,
                  children: const [
                    PrayerAndOthersCard(icon: othersIcon1, text: 'Hazz Umrah'),
                    PrayerAndOthersCard(icon: othersIcon2, text: 'Calendar'),
                    PrayerAndOthersCard(
                      icon: othersIcon3,
                      text: 'Zakat Calculator',
                    ),
                    PrayerAndOthersCard(
                      icon: othersIcon4,
                      text: 'Kitab Download',
                    ),
                    PrayerAndOthersCard(
                      icon: othersIcon5,
                      text: 'Ticktack Task',
                    ),
                    PrayerAndOthersCard(icon: othersIcon6, text: 'Article'),
                    PrayerAndOthersCard(icon: othersIcon7, text: 'Lecture'),
                    PrayerAndOthersCard(icon: othersIcon8, text: 'Naseed'),
                    PrayerAndOthersCard(
                      icon: othersIcon9,
                      text: 'Important Days',
                    ),
                    PrayerAndOthersCard(
                      icon: othersIcon10,
                      text: 'Popular Quote',
                    ),
                    PrayerAndOthersCard(icon: othersIcon11, text: 'Shahada'),
                    PrayerAndOthersCard(icon: othersIcon12, text: 'Tasbih'),
                    PrayerAndOthersCard(
                      icon: othersIcon13,
                      text: 'Halal Place',
                    ),
                    PrayerAndOthersCard(icon: othersIcon10, text: 'Mistake'),
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
