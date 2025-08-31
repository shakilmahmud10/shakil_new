// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'reading_dua.dart';
import 'widgets/colors.dart';
import 'widgets/style.dart';
import 'widgets/images.dart';

//--------------------------------
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenges',
      theme: ThemeData(scaffoldBackgroundColor: kPureWhite),
      home: const ChallengesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPureWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kPrimaryGreen),
          onPressed: () {},
        ),
        title: const Text(
          'Challenges',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kTextDark,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: kOfferGradients1,
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: kOfferGradients1,
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 225, 216),
                      width: 2,
                    ),
                  ),

                  child: Image.asset(kCoin1, height: 20, width: 20),
                ),
                const Text(
                  '1000',
                  style: TextStyle(
                    color: kCoinText,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              ChallengeCard(
                battleIcon: kPngIcon1, // modified
                title: 'Daily Log in Bonus',
                reward: '1545',
                actionWidget: const ProgressRing(progress: 0.33),
              ),
              const SizedBox(height: 16),
              ChallengeCard(
                battleIcon: kPngIcon2, // modified
                title: 'Move beads 99 times',
                reward: '1545',
                actionWidget: const CollectButton(),
              ),
              const SizedBox(height: 16),
              ChallengeCard(
                battleIcon: kPngIcon3, // modified
                title: 'Move beads 33 times',
                reward: '1545',
                actionWidget: const ProgressRing(progress: 0.85),
              ),
              const SizedBox(height: 16),
              ChallengeCard(
                battleIcon: kPngIcon4, // modified
                title: 'Move beads 99 times',
                reward: '1545',
                actionWidget: const CollectButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChallengeCard extends StatelessWidget {
  final String battleIcon;
  final String title;
  final String reward;
  final Widget actionWidget;

  const ChallengeCard({
    Key? key,
    required this.battleIcon,
    required this.title,
    required this.reward,
    required this.actionWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: kLightGreenBackground.withOpacity(0.6), // 👈 opacity added
        borderRadius: BorderRadius.circular(14),
        border: Border.all(width: 2, color: kPrimaryGreen.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            margin: const EdgeInsets.only(right: 16),
            child: Image.asset(
              battleIcon,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, color: Colors.red); // modified
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, color: kTextDark),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Color(0xFFf59e0b), Color(0xFFd97706)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: const Color(0xFFFFF1CC),
                          width: 2,
                        ),
                      ),
                      child: Image.asset(kCoin1, height: 20, width: 20),
                    ),
                    Text(
                      reward,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: kCoinText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          actionWidget,
        ],
      ),
    );
  }
}

class CollectButton extends StatelessWidget {
  const CollectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReadingDua()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryGreen,
        foregroundColor: kLightWhite2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),
      child: const Text('Collect', style: TextStyle(fontSize: 16)),
    );
  }
}

class ProgressRing extends StatelessWidget {
  final double progress;

  const ProgressRing({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1.0,
            strokeWidth: 6,
            strokeCap: StrokeCap.round,
            valueColor: AlwaysStoppedAnimation<Color>(kLightWhite2),
          ),
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 6,
            strokeCap: StrokeCap.round,
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryGreen),
          ),
        ],
      ),
    );
  }
}
