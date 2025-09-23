import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

// void main() {
//   runApp(PlayList());
// }

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  static const Color bg = Color(0xFFF4F8F4);
  static const Color primary = Color(0xFF2F6E62);
  static const Color primaryDeep = Color(0xFF2A5F56);
  static const Color muted = Color(0xFF8AA298);
  static const Color trackBg = Color(0xFFE5EEE6);
  static const Color cardTop = Color(0xFFDDEBE1);
  static const Color cardBottom = Color(0xFF5A9885);

  // static const 

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
            fontSize: 18,
          ),
          bodyMedium: TextStyle(
            color: muted,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
          labelSmall: TextStyle(
            color: primaryDeep,
            fontWeight: FontWeight.w600,
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

    const String iconBack  = 'assets/images/svg/playlist/arrow-left.svg';
    const String iconShare  = 'assets/images/svg/playlist/share-2.svg';
    const String iconSuffle  = 'assets/images/svg/playlist/shuffle.svg';
    const String iconForward  = 'assets/images/svg/playlist/next.svg';
    const String iconPlay  = 'assets/images/svg/playlist/play.svg';
    const String iconPrevious  = 'assets/images/svg/playlist/previous.svg';
    const String iconList  = 'assets/images/svg/playlist/list-ul.svg';

    final Size size = MediaQuery.of(context).size;
    final double horizontal = 20;
    final double albumSize = size.width - (horizontal * 2);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PlayList.bg,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          // child: SvgPicture.asset(iconBack),
          child: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child:Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 6),
              const SizedBox(height: 50),
              // Album Art
              Center(
                child: Container(
                  width: albumSize - 20,
                  height: albumSize - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [cardTop, cardBottom],
                      stops: [0.0, 1.0],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: primary.withOpacity(0.10),
                        blurRadius: 24,
                        offset: const Offset(0, 14),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // soft glow
                      Positioned(
                        left: 22,
                        top: 22,
                        child: Container(
                          width: albumSize * .55,
                          height: albumSize * .55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.22),
                          ),
                        ),
                      ),
                      // book icon
                      Center(
                        child: Icon(
                          Icons.menu_book_rounded,
                          size: albumSize * .36,
                          color: Colors.white.withOpacity(.92),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // const SizedBox(height: 22),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  children: [
                    Text(
                      '1.Badnajar (Evil Eye). Rukiyah for human beings',
                      style: const TextStyle(
                        color: primaryDeep,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        letterSpacing: 0.1,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Center(child: const Text('Add Info')),
                    const SizedBox(height: 32),
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.centerLeft,
                          clipBehavior: Clip.none, // circle overflow allow করবে
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
                            // Circle with better positioning
                            FractionallySizedBox(
                              widthFactor: 0.22,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: primary,
                                      width: 5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: primary.withOpacity(0.3),
                                        blurRadius: 8,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '00:50:30',
                              style: TextStyle(
                                color: PlayList.primaryDeep,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '01:30:00',
                              style: TextStyle(
                                color: PlayList.primaryDeep,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.shuffle_rounded,
                          size: 26,
                          color: primary.withOpacity(.75),
                        ),
                        Icon(
                          Icons.skip_previous_rounded,
                          size: 28,
                          color: primary.withOpacity(.85),
                        ),
                        Container(
                          width: 74,
                          height: 74,
                          decoration: BoxDecoration(
                            color: primary,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: primary.withOpacity(.28),
                                blurRadius: 24,
                                offset: const Offset(0, 12),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.skip_next_rounded,
                          size: 28,
                          color: primary.withOpacity(.85),
                        ),
                        Icon(
                          Icons.equalizer_rounded,
                          size: 24,
                          color: primary.withOpacity(.80),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _roundIcon({
    required IconData icon,
    required Color color,
    required Color bgColor,
    double size = 22,
    double padding = 8,
  }) {
    return Container(
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      padding: EdgeInsets.all(padding),
      child: Icon(icon, size: size, color: color),
    );
  }
}
