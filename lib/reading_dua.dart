// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'widgets/colors.dart';
import 'widgets/style.dart';
import 'widgets/images.dart';

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
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kTextDark,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward, color: kPrimaryGreen),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        children: [
          // Search Bar
          TextField(
            style: const TextStyle(color: kTextDark, fontSize: 16),
            decoration: InputDecoration(
              hintText: 'Search by categories Name',
              hintStyle: TextStyle(
                color: kTextLight.withOpacity(0.8),
                fontSize: 16,
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 18, right: 8),
                child: Icon(
                  Icons.search_rounded,
                  size: 28,
                  color: kPrimaryGreen,
                ),
              ),
              filled: true,
              fillColor: kCardAndSearchBackground,
              contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide(
                  color: kPrimaryGreen.withOpacity(0.4),
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide(
                  color: kPrimaryGreen.withOpacity(0.4),
                  width: 1.0,
                ), // opacity .5 when not focused
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide(
                  color: kPrimaryGreen.withOpacity(0.8),
                  width: 1.5,
                ), // full opacity when focused
              ),
            ),
          ),

          const SizedBox(height: 18),

          DuaCategoryCard(
            duaIcon: kDuaIcon1,
            title: "Dua Importance",
            subTitle: "7 Subcategories",
            numberOfDuas: 50,
          ),

          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kDuaIcon2,
            title: "Dua Acceptance",
            subTitle: "10 Subcategories",
            numberOfDuas: 33,
          ),

          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kDuaIcon3,
            title: "Time of Dua",
            subTitle: "5 Subcategories",
            numberOfDuas: 25,
          ),

          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kDuaIcon4,
            title: "Hazz & Umrah",
            subTitle: "9 Subcategories",
            numberOfDuas: 42,
          ),

          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kDuaIcon5,
            title: "Witr & Other",
            subTitle: "30 Subcategories",
            numberOfDuas: 22,
          ),

          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kDuaIcon6,
            title: "Fasting",
            subTitle: "12 Subcategories",
            numberOfDuas: 44,
          ),

          const SizedBox(height: 12),

          DuaCategoryCard(
            duaIcon: kDuaIcon7,
            title: "Ablution & Bath",
            subTitle: "15 Subcategories",
            numberOfDuas: 47,
          ),
        ],
      ),
    );
  }
}

class DuaCategoryCard extends StatelessWidget {
  final String duaIcon;
  final String title;
  final String subTitle;
  final int numberOfDuas;

  const DuaCategoryCard({
    Key? key,
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
        color: kCardAndSearchBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kPrimaryGreen.withOpacity(0.1), width: 1),
      ),
      child: Row(
        children: [
          // Icon Container
          Container(width: 60, height: 60, child: Image.asset(duaIcon)),
          const SizedBox(width: 16),

          // Title and Subtitle Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kTextDark,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subTitle,
                  style: const TextStyle(fontSize: 14, color: kTextLight),
                ),
              ],
            ),
          ),

          // Divider and Dua Count Section
          Row(
            children: [
              Container(
                height: 40,
                width: 1.5,
                color: kPrimaryGreen.withOpacity(0.2), // soft divider
                margin: const EdgeInsets.symmetric(horizontal: 16),
              ),
              SizedBox(
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      numberOfDuas.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
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
