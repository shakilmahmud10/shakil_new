import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const DuaImportanceApp());

class AppPalette {
  // Carefully matched to your Tailwind variables
  static const bg          = Color(0xFFF7FBF7); // off‑white mint
  static const surface     = Color(0xFFE9F1E9); // soft card green
  static const ink900      = Color(0xFF22312B); // title dark
  static const ink700      = Color(0xFF3E544C); // body strong
  static const ink600      = Color(0xFF687C73); // body muted
  static const primary700  = Color(0xFF2F5D51); // deep teal-green
  static const primary600  = Color(0xFF3C7464); // icon + accents
  static const primary500  = Color(0xFF5E9082); // lighter icons
  static const accent600   = Color(0xFFF1A640); // timer pill top
  static const accent500   = Color(0xFFF5BC63); // timer pill bottom
  static const fab         = Color(0xFF2F6C5C); // FAB fill
  static const shadow      = Color(0xFF1C342D); // greenish shadow
  static const radiusXL    = 22.0;
}

class DuaImportanceApp extends StatelessWidget {
  const DuaImportanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme().copyWith(
      headlineSmall: TextStyle(
        fontSize: 22, fontWeight: FontWeight.w700, color: AppPalette.primary700),
      titleLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w800, color: AppPalette.ink900),
      bodyLarge: TextStyle(
        fontSize: 17, height: 1.6, color: AppPalette.ink700),
      bodyMedium: TextStyle(
        fontSize: 17, height: 1.6, color: AppPalette.ink600),
      labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dua Importance',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppPalette.bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppPalette.primary600,
          primary: AppPalette.primary600,
          secondary: AppPalette.accent500,
          background: AppPalette.bg,
          surface: AppPalette.surface,
          onPrimary: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: textTheme,
        iconTheme: const IconThemeData(color: AppPalette.primary600),
      ),
      home: const DuaImportancePage(),
    );
  }
}

class DuaImportancePage extends StatelessWidget {
  const DuaImportancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 140),
              children: [
                // Header
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      tooltip: 'Go back',
                      icon: const Icon(Icons.arrow_back, size: 24),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text('Dua Importance', style: t.titleLarge),
                    ),
                    _TimerPill(),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {},
                      tooltip: 'Settings',
                      icon: const Icon(Icons.settings, size: 24),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Section card
                Container(
                  decoration: BoxDecoration(
                    color: AppPalette.surface,
                    borderRadius:
                        BorderRadius.circular(AppPalette.radiusXL),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: RichText(
                    text: TextSpan(
                      style: t.bodyLarge!.copyWith(color: AppPalette.ink700),
                      children: const [
                        TextSpan(
                          text: 'Section: ',
                          style: TextStyle(
                            color: AppPalette.primary700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:
                              'The most important thing to ask Allah for',
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Number + Title
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: AppPalette.primary600,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '4',
                        style: t.titleSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'The servant is dependent on his Lord #1',
                        style: t.headlineSmall,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // Arabic Ayah
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      height: 1.5,
                      color: AppPalette.primary700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Transliteration
                Text(
                  "Iyyaaka na'budu wa Iyyaaka nasta'een",
                  style: t.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
                ),

                const SizedBox(height: 16),

                // Translation Paragraphs
                Text(
                  'It is You we worship and It is You we ask for help.',
                  style: t.bodyLarge,
                ),
                const SizedBox(height: 14),
                Text(
                  'He whom Allah guides is the [rightly] guided, but he whom He leaves astray – never will you find for him a protecting guide. (Surah Al-Kahf 18:17)',
                  style: t.bodyLarge,
                ),

                const SizedBox(height: 24),

                // Reference
                Text('Reference:', style: t.bodyMedium),
                const SizedBox(height: 6),
                Text(
                  'Muslim: 770',
                  style: t.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppPalette.ink900,
                  ),
                ),
              ],
            ),

            // Bottom icon row
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _CircleIconButton(
                        icon: Icons.bookmark_add_outlined,
                        tooltip: 'Bookmark',
                      ),
                      _CircleIconButton(
                        icon: Icons.emoji_objects_outlined,
                        tooltip: 'Insight',
                      ),
                      _CircleIconButton(
                        icon: Icons.play_arrow_rounded,
                        tooltip: 'Play',
                      ),
                      _CircleIconButton(
                        icon: Icons.event_note_outlined,
                        tooltip: 'Schedule',
                      ),
                      _CircleIconButton(
                        icon: Icons.more_vert,
                        tooltip: 'More',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
            color: AppPalette.fab,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: AppPalette.shadow.withOpacity(0.35),
                blurRadius: 30,
                spreadRadius: 0,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.format_list_bulleted_rounded,
                color: Colors.white, size: 26),
            tooltip: 'Open list',
          ),
        ),
      ),
    );
  }
}

class _TimerPill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppPalette.accent600, AppPalette.accent500],
        ),
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.av_timer_rounded, color: Colors.white, size: 18),
          const SizedBox(width: 6),
          Text('01.56s', style: t.labelLarge),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  const _CircleIconButton({required this.icon, required this.tooltip});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        onPressed: () {},
        tooltip: tooltip,
        icon: Icon(icon, size: 30, color: AppPalette.primary600),
        splashRadius: 28,
      ),
    );
  }
}