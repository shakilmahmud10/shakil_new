import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.scaffold,
        fontFamily: 'Roboto',
      ),
      home: const DrawerPage(),
    );
  }
}

// ====== Constants ======
class AppColors {
  // Base
  static const scaffold = Color(0xFFFFFFFF);
  static const headerText = Color(0xFF111827);
  static const listTitle = Color(0xFF111827);
  static const listSubtitle = Color(0xFF6B7280);
  static const icon = Color(0xFF7A7F87);
  static const divider = Color(0xFFE5E7EB);

  // Card
  static const memberCardBg = Color(0xFFFBEDE6); // soft peach
  static const memberCardBgTint = Color(
    0xFFFFF6F2,
  ); // lighter peach for subtle gradient blob
  static const iconBg = Color(0xFFE6F2EE);
  static const iconRing = Color(0xFFD4E6E0);
  static const accentGreen = Color(0xFF0B5B53);
  static const accentGreenDark = Color(0xFF08453F);
  static const accentGreenLight = Color(0xFF0E6E63);
}

class AppIcons {
  static const theme = Icons.light_mode_outlined;
  static const calculation = Icons.school_outlined;
  static const juristic = Icons.gavel_outlined;
  static const notifications = Icons.notifications_none_rounded;
  static const share = Icons.share_outlined;
  static const about = Icons.help_outline_rounded;
  static const memberShield = Icons.security;
}

class AppTextStyles {
  static const header = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.headerText,
  );

  static const listTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.listTitle,
  );

  static const listSubtitle = TextStyle(
    fontSize: 12,
    height: 1.25,
    color: AppColors.listSubtitle,
    fontWeight: FontWeight.w400,
  );

  static const cardOverline = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.listSubtitle,
    letterSpacing: 0.2,
  );

  static const cardHeadline = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.listTitle,
  );

  static const cardBody = TextStyle(
    fontSize: 13.5,
    height: 1.35,
    color: AppColors.listSubtitle,
    fontWeight: FontWeight.w400,
  );

  static const button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    letterSpacing: 0.2,
  );
}

// ====== Data model ======
class SettingItem {
  final IconData icon;
  final String title;
  final String? subtitle;

  SettingItem({required this.icon, required this.title, this.subtitle});
}

// ====== Page ======
class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <SettingItem>[
      SettingItem(
        icon: AppIcons.theme,
        title: 'Theme',
        subtitle: 'Light Theme',
      ),
      SettingItem(
        icon: AppIcons.calculation,
        title: 'Calculation Method',
        subtitle: 'University of Islamic Sciences, Karachi',
      ),
      SettingItem(
        icon: AppIcons.juristic,
        title: 'Juristic Method',
        subtitle: 'Hanafi',
      ),
      SettingItem(icon: AppIcons.notifications, title: 'Notification'),
      SettingItem(
        icon: AppIcons.share,
        title: 'Share App',
        subtitle: 'Share and gain reward',
      ),
      SettingItem(
        icon: AppIcons.about,
        title: 'About Sadiq (1.7.0)',
        subtitle:
            'An everyday companion for Muslims on their journey to please Allah!',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // List header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: const BoxDecoration(
                color: AppColors.scaffold,
                border: Border(
                  bottom: BorderSide(color: AppColors.iconRing, width: 1),
                ),
              ),
              alignment: Alignment.centerLeft,
              child: const Text('Settings', style: AppTextStyles.header),
            ),

            // List + Custom Container
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 4, bottom: 20),
                itemCount: items.length + 1, // last one is the custom container
                separatorBuilder: (_, __) => const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.iconRing,
                  indent: 16,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  if (index < items.length) {
                    final item = items[index];
                    return _SettingsTile(item: item);
                  }
                  // Bottom custom container
                  return const Padding(
                    padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
                    child: MemberCard(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ====== Widgets ======
class _SettingsTile extends StatelessWidget {
  final SettingItem item;
  const _SettingsTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.scaffold,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: Icon(item.icon, color: AppColors.icon, size: 22),
        title: Text(item.title, style: AppTextStyles.listTitle),
        subtitle: item.subtitle == null
            ? null
            : Text(item.subtitle!, style: AppTextStyles.listSubtitle),
        horizontalTitleGap: 10,
        dense: false,
        visualDensity: const VisualDensity(horizontal: 0, vertical: 0),
        onTap: () {},
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFe1ebe1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFceddd1), width: 1),
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(
              'Become a Member',
              style: AppTextStyles.cardOverline,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.accentGreen,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.iconRing, width: 2),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/svg/duaRuqyah/lovely.svg',
                    height: 22,
                    width: 22,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Keep Sadiq Safe from Ads',
                      style: AppTextStyles.cardHeadline,
                    ),
                    const SizedBox(height: 6),
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.cardBody,
                        children: const [
                          TextSpan(
                            text: 'Our commitment to keep the Sadiq app ',
                          ),
                          TextSpan(
                            text: 'ad-free',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.listTitle,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' is possible because of the support of people like you.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Donate Button
          Container(
            height: 44,
            child: InkWell(
              borderRadius: BorderRadius.circular(28),
              onTap: () {
                // এখানে তোমার onPressed কাজ করবে
                print("Donate button clicked!");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.accentGreen,
                  borderRadius: BorderRadius.circular(28),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/images/svg/duaRuqyah/Zakat.svg",
                      width: 20,
                      height: 20,
                      color: Colors.white, // icon কে সাদা দেখাবে
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Donate Now',
                      style: AppTextStyles.button,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
