import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shakil_new/Icon%20Components/ebook_and_quick_action.dart';
import '../widgets/colors.dart';
import '../widgets/images.dart';

class QuickIconcomponents extends StatelessWidget {
  const QuickIconcomponents({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran Majeed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const QuranMajeedScreen(),
    );
  }
}

class QuranMajeedScreen extends StatelessWidget {
  const QuranMajeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPureWhite,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kPrimaryGreen),
          onPressed: (){Navigator.pop(context);},
          tooltip: 'Back',
        ),
        title: const Text(
          'Quran Majeed, Dua & Rukiyah',
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
                MaterialPageRoute(builder: (context) => EbookAndQuickAction()),
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
                Flexible(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                    children: [
                      QuranFeatureCard(icon: qIconq1, textName: 'Last Read'),
                      QuranFeatureCard(icon: qIconq2, textName: 'Nurani'),
                      QuranFeatureCard(icon: qIconq3, textName: 'Hafezi'),
                      QuranFeatureCard(icon: qIconq4, textName: 'Support'),
                      QuranFeatureCard(icon: qIconq5, textName: 'Support Us'),
                      QuranFeatureCard(icon: qIconq6, textName: 'Duas'),
                      QuranFeatureCard(icon: qIconq7, textName: 'Info'),
                      QuranFeatureCard(icon: qIconq8, textName: 'Info'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(height: 30),
                Flexible(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                    children: [
                      DuaCard(
                        icon: duaIconq1,
                        textName: 'Last Read',
                        iconBackgroundColor: pureBlue,
                      ),
                      DuaCard(
                        icon: duaIconq2,
                        textName: 'Challanges',
                        iconBackgroundColor: pureOrange,
                      ),
                      DuaCard(
                        icon: duaIconq3,
                        textName: 'Self Ruqyah',
                        iconBackgroundColor: regularGreen,
                      ),
                      DuaCard(
                        icon: duaIconq4,
                        textName: 'Books',
                        iconBackgroundColor: pureGreen,
                      ),
                      DuaCard(
                        icon: duaIconq5,
                        textName: 'Dhikr',
                        iconBackgroundColor: pureGreen,
                      ),
                      DuaCard(
                        icon: duaIconq6,
                        textName: 'Prayer Time',
                        iconBackgroundColor: purePurple,
                      ),
                      DuaCard(
                        icon: duaIconq7,
                        textName: 'Other Apps',
                        iconBackgroundColor: pureBlue,
                      ),
                      DuaCard(
                        icon: duaIconq8,
                        textName: 'Support Us',
                        iconBackgroundColor: purePink,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuranFeatureCard extends StatelessWidget {
  final String icon;
  final String textName;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final Color? textColor;

  const QuranFeatureCard({
    Key? key,
    required this.icon,
    required this.textName,
    this.iconColor = const Color(0xFF794E2C),
    this.iconBackgroundColor = const Color(0xFFF1EAE1),
    this.textColor = const Color(0xFF3E2E28),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(child: SvgPicture.asset(icon)),
        ),
        SizedBox(height: 6),
        Flexible(
          child: Text(
            textName,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class DuaCard extends StatelessWidget {
  final String icon;
  final String textName;
  final Color? iconBackgroundColor;
  final Color? textColor;

  const DuaCard({
    Key? key,
    required this.icon,
    required this.textName,
    this.iconBackgroundColor = const Color(0xFFF1EAE1),
    this.textColor = const Color(0xFF3E2E28),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: iconBackgroundColor!.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(
              color: iconBackgroundColor!.withOpacity(0.2),
              width: 2,
            ),
          ),
          child: Center(child: SvgPicture.asset(icon)),
        ),

        SizedBox(height: 8),
        Flexible(
          child: Text(
            textName,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
