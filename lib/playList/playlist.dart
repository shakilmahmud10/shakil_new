import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  static const Color bg = Color(0xFFF4F8F4);
  static const Color primary = Color(0xFF2F6E62);
  static const Color primaryDeep = Color(0xFF2A5F56);
  static const Color muted = Color(0xFF8AA298);
  static const Color trackBg = Color(0xFFE5EEE6);
  static const Color cardTop = Color(0xFFDDEBE1);
  static const Color cardBottom = Color(0xFF5A9885);
  static const Color textDark = Color(0xFF282e29);
  static const Color textLight = Color(0xFF7d827d);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlayListPage(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: bg,
        iconTheme: const IconThemeData(color: primary, size: 22),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: primaryDeep,
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
            fontSize: 18,
          ),
          bodyMedium: TextStyle(
            color: muted,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
            fontSize: 13,
          ),
          labelSmall: TextStyle(
            color: primaryDeep,
            fontWeight: FontWeight.w600,
            fontFamily: "Inter",
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class PlayListPage extends StatelessWidget {
  const PlayListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bg = PlayList.bg;
    const Color primary = PlayList.primary;
    const Color primaryDeep = PlayList.primaryDeep;
    const Color muted = PlayList.muted;
    const Color trackBg = PlayList.trackBg;
    const Color cardTop = PlayList.cardTop;
    const Color cardBottom = PlayList.cardBottom;
    const Color textDark = PlayList.textDark;
    const Color textlight = PlayList.textLight;

    const String iconBack = 'assets/images/svg/playlist/arrow-left.svg';
    const String iconShare = 'assets/images/svg/playlist/share-2.svg';
    const String iconSuffle = 'assets/images/svg/playlist/shuffle.svg';
    const String iconForward = 'assets/images/svg/playlist/next.svg';
    const String iconPlay = 'assets/images/svg/playlist/play.svg';
    const String iconPrevious = 'assets/images/svg/playlist/previous.svg';
    const String iconList = 'assets/images/svg/playlist/list-ul.svg';

    final Size size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;
    final double horizontal = 20;

    // Responsive sizes based on screen height
    final double appBarHeight = screenHeight * 0.08; // 8% of screen
    final double albumSize = screenHeight * 0.40; // 35% of screen
    final double titleFontSize = screenHeight * 0.025; // 2.5% of screen
    final double playButtonSize = screenHeight * 0.12; // 8% of screen

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PlayList.bg,
        elevation: 0,
        toolbarHeight: appBarHeight.clamp(56, 80), // min 56, max 80
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Transform.scale(
            scale: 0.7,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(iconBack),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: SvgPicture.asset(iconShare),
          ),
        ],
      ),
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontal),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top spacing - responsive
                  SizedBox(height: constraints.maxHeight * 0.02),

                  // Album Art - responsive size
                  Flexible(
                    flex: 4,
                    child: Center(
                      child: Container(
                        width: albumSize.clamp(200, 400), // min-max limits
                        height: albumSize.clamp(200, 400),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: primary.withOpacity(0.15),
                              blurRadius: 12,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/images/svg/playlist/playlistImage.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Middle spacing
                  SizedBox(height: constraints.maxHeight * 0.03),

                  // Bottom content - responsive
                  Flexible(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Title section
                        Column(
                          children: [
                            Text(
                              'Badanjar (Evil Eye). Rukiyah of Badanjar',
                              style: TextStyle(
                                color: PlayList.textDark,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontSize: titleFontSize.clamp(18, 24),
                                letterSpacing: 0.1,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            Text(
                              'Add Info',
                              style: TextStyle(
                                color: textlight,
                                fontFamily: "Poppins",
                                fontSize: screenHeight * 0.018,
                              ),
                            ),
                          ],
                        ),

                        // Progress bar section
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.centerLeft,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: trackBg,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: 0.22,
                                  child: Container(
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: primary.withOpacity(0.85),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '00:50:30',
                                  style: TextStyle(
                                    color: PlayList.textDark,
                                    fontSize: screenHeight * 0.014,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '01:30:00',
                                  style: TextStyle(
                                    color: PlayList.textDark,
                                    fontSize: screenHeight * 0.014,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Control buttons section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              iconSuffle,
                              height: screenHeight * 0.035,
                            ),
                            SvgPicture.asset(
                              iconPrevious,
                              height: screenHeight * 0.035,
                            ),
                            Container(
                              width: playButtonSize.clamp(60, 80),
                              height: playButtonSize.clamp(60, 80),
                              decoration: BoxDecoration(
                                color: const Color(0xFF537f6d),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  iconPlay,
                                  height: playButtonSize * 0.35,
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              iconForward,
                              height: screenHeight * 0.035,
                            ),
                            SvgPicture.asset(
                              iconList,
                              height: screenHeight * 0.035,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Bottom padding - responsive
                  SizedBox(height: constraints.maxHeight * 0.03),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
