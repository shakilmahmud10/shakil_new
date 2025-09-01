// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'reading_dua.dart';
import 'widgets/colors.dart';
import 'widgets/style.dart';
import 'widgets/images.dart';

class Challenges extends StatelessWidget {
  const Challenges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPureWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kPrimaryGreen),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Challenges',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: kTextDark,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.fromLTRB(6, 5, 8, 5),
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
                  ),

                  child: Image.asset(kCoin1, height: 20, width: 20),
                ),
                const Text(
                  '1000',
                  style: TextStyle(
                    color: kCoinText,
                    fontWeight: FontWeight.w600,
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
                actionWidget: const ProgressRing(progress: 0.33),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: kCardAndSearchBackground2,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(width: 2, color: kLightWhite3.withOpacity(0.3)),
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
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: kTextDark,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 26,
                      height: 26,
                      margin: const EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: kOfferGradients1,
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
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
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
  const CollectButton({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),
      child: const Text(
        'Collect',
        style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
      ),
    );
  }
}

class ProgressRing extends StatelessWidget {
  final double progress;

  const ProgressRing({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1.0,
            strokeWidth: 4,
            strokeCap: StrokeCap.round,
            valueColor: AlwaysStoppedAnimation<Color>(kLightWhite3),
          ),
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 4,
            strokeCap: StrokeCap.round,
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryGreen),
          ),
        ],
      ),
    );
  }
}
