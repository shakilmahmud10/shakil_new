// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:shakil_new/widgets/refectors.dart';
import 'widgets/colors.dart';
import 'widgets/style.dart';
import 'widgets/images.dart';

class AppPalette {
  // Carefully matched to your Tailwind variables
  static const bg = Color(0xFFF7FBF7); // off‑white mint
  static const surface = Color(0xFFE9F1E9); // soft card green
  static const ink900 = Color(0xFF22312B); // title dark
  static const ink700 = Color(0xFF3E544C); // body strong
  static const ink600 = Color(0xFF687C73); // body muted
  static const primary700 = Color(0xFF2F5D51); // deep teal-green
  static const primary600 = Color(0xFF3C7464); // icon + accents
  static const primary500 = Color(0xFF5E9082); // lighter icons
  static const accent600 = Color(0xFFF1A640); // timer pill top
  static const accent500 = Color(0xFFF5BC63); // timer pill bottom
  static const fab = Color(0xFF2F6C5C); // FAB fill
  static const shadow = Color(0xFF1C342D); // greenish shadow
  static const radiusXL = 22.0;
}

class DuaImportanceDetails extends StatelessWidget {
  const DuaImportanceDetails({super.key});

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
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: kOfferGradients1,
            ),
            child: Text(
              '01.56s',
              style: TextStyle(
                color: kCoinText,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/icon/setting-2.png'),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: kCardAndSearchBackground3,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: RichText(
              text: TextSpan(
                children: const [
                  TextSpan(
                    text: 'Section: ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: kPrimaryGreen,
                      fontWeight: FontWeight.w800,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text:
                        'The most important thing to ask Allah for your forgiveness',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: kTextDark,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: kPrimaryGreen,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '4',
                    style: TextStyle(
                      color: kPureWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'The servant is dependent on his Lord #1',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: kPrimaryGreen,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                color: kPureBlack,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Transliteration
          Text(
            "Iyyaaka na'budu wa Iyyaaka nasta'een",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w200,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            'It is You we worship and It is You we ask for help.',
            style: TextStyle(
              fontSize: 14,
              color: kPureBlack,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'He whom Allah guides is the [rightly] guided, but he whom He leaves astray – never will you find for him a protecting guide. (Surah Al-Kahf 18:17)',
            style: TextStyle(fontSize: 14, color: kPureBlack, height: 2),
          ),

          const SizedBox(height: 24),

          // Reference
          Text('Reference:', style: TextStyle(fontSize: 12)),
          const SizedBox(height: 6),
          Text(
            'Muslim: 770',
            style: TextStyle(
              fontSize: 14,
              color: kPureBlack,
              fontWeight: FontWeight.w800,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/icon/bookmark-02.png'),
              Image.asset('assets/images/icon/lamp-charge.png'),
              Image.asset('assets/images/icon/play.png'),
              Image.asset('assets/images/icon/calendar.png'),
              Image.asset('assets/images/icon/more-vertical.png'),
            ],
          ),
        ],
      ),

      // Floating list FAB
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Semantics(
        button: true,
        label: 'Open list',
        child: Container(
          margin: const EdgeInsets.only(right: 12, bottom: 40),
          width: 72,
          height: 56,
          decoration: BoxDecoration(
            color: kPrimaryGreen,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: kPureBlack.withOpacity(0.25),
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.format_list_bulleted_rounded,
              color: Colors.white,
              size: 26,
            ),
            tooltip: 'Open list',
          ),
        ),
      ),
    );
  }
}
