// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakil_new/Challanges/dua_importance.dart';
import '../Core Components/colors.dart';
import '../Core Components/refectors.dart';
import '../Core Components/style.dart';
import '../Core Components/images.dart';

class ReadingDua extends StatelessWidget {
  const ReadingDua({super.key});

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
          'Reading Dua',
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
                MaterialPageRoute(builder: (context) => DuaImportance()),
              );
            },
            icon: Icon(Icons.arrow_forward, color: kPrimaryGreen),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        children: [
          // Search
          kSearchBar(hintText: 'Search by Subcategories Name'),

          const SizedBox(height: 18),

          DuaCategoryCard(
            duaIcon: kReadingDua1,
            tabIconBGColor: kTabBG4,
            title: "Dua Importance",
            subTitle: "7 Subcategories",
            numberOfDuas: 50,
          ),

          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kReadingDua2,
            tabIconBGColor: kTabBG2,
            title: "Dua Acceptance",
            subTitle: "10 Subcategories",
            numberOfDuas: 33,
          ),

          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kReadingDua3,
            tabIconBGColor: kTabBG3,
            title: "Time of Dua",
            subTitle: "5 Subcategories",
            numberOfDuas: 25,
          ),

          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kReadingDua4,
            title: "Hazz & Umrah",
            subTitle: "9 Subcategories",
            numberOfDuas: 42,
          ),

          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kReadingDua5,
            title: "Witr & Other",
            subTitle: "30 Subcategories",
            numberOfDuas: 22,
          ),

          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kReadingDua6,
            title: "Fasting",
            subTitle: "12 Subcategories",
            numberOfDuas: 44,
          ),

          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kReadingDua7,
            title: "Ablution & Bath",
            subTitle: "15 Subcategories",
            numberOfDuas: 47,
          ),
          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kReadingDua2,
            title: "Time of Dua",
            subTitle: "5 Subcategories",
            numberOfDuas: 25,
          ),

          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kReadingDua5,
            title: "Hazz & Umrah",
            subTitle: "9 Subcategories",
            numberOfDuas: 42,
          ),
        ],
      ),
    );
  }
}

class DuaCategoryCard extends StatelessWidget {
  final Color? tabIconBGColor;
  final String duaIcon;
  final String title;
  final String subTitle;
  final int numberOfDuas;

  const DuaCategoryCard({
    Key? key,
    this.tabIconBGColor,
    required this.duaIcon,
    required this.title,
    required this.subTitle,
    required this.numberOfDuas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: kCardAndSearchBackground2,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kLightWhite3.withOpacity(0.4), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: tabIconBGColor ?? kTabBG4,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(duaIcon),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: kTextDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subTitle,
                  style: const TextStyle(fontSize: 14, color: kTextLight),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 1.5,
                color: kPrimaryGreen.withOpacity(0.2),
                margin: const EdgeInsets.symmetric(horizontal: 12),
              ),
              SizedBox(
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      numberOfDuas.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: kTextDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Duas',
                      style: TextStyle(fontSize: 14, color: kTextLight),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
