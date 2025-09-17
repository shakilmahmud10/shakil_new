import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const SettingsApp());
}

class SettingsApp extends StatelessWidget {
  const SettingsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Qurangeneralsetting(),
    );
  }
}

class AppColors {
  static const Color appBarBackground = Color(0xFFF5E9D9);
  static const Color containerBackground = Color(0xFFF2EAE0);
  static const Color primaryBrown = Color(0xFF895737);
  static const Color sliderInactive = Color(0xFFD9CFC4);

  static const scaffold = Color(0xFFFFFFFF);
  static const headerText = Color(0xFF111827);
  static const listTitle = Color(0xFF111827);
  static const listSubtitle = Color(0xFF6B7280);

  static const dividerSoft = Color(0xFFF4ECE3);
}

const String sectionIcons1 = "assets/images/svg/duaRuqyah/setting.svg";
const String sectionIcons2 = "assets/images/svg/duaRuqyah/shapes.svg";
const String sectionIcons3 = "assets/images/svg/duaRuqyah/element-1.svg";
const String sectionIcons4 = "assets/images/svg/duaRuqyah/menu-board.svg";
const String sectionIcons5 = "assets/images/svg/duaRuqyah/image.svg";
const String sectionIcons6 =
    "assets/images/svg/duaRuqyah/notification-bing.svg";

class AppTextStyles {
  static const header = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static const listTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.listTitle,
  );

  static const listSubtitle = TextStyle(
    fontSize: 11,
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

class Qurangeneralsetting extends StatefulWidget {
  const Qurangeneralsetting({super.key});
  @override
  State<Qurangeneralsetting> createState() => _QurangeneralsettingState();
}

class _QurangeneralsettingState extends State<Qurangeneralsetting> {
  double _arabicFontSize = 28;
  double _translationFontSize = 28;
  bool _tajweedColor = false;
  bool _keepScreenOn = false;
  bool _wordByWord = false;
  bool _showArabic = false;
  bool _showTranslation = false;
  bool _showOtherInfo = false;
  bool _dailyNotification = false;
  int _selectedThemeIndex = 0;

  // Start ALL sections collapsed
  bool _isGeneralSettingsExpanded = false;
  bool _isFontSettingsExpanded = false;
  bool _isAppearanceSettingsExpanded = false;
  bool _isViewSettingsExpanded = false;
  bool _isNotificationSettingsExpanded = false;
  bool _isWordByWordExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfaf6ee),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFfaf6ee),
        elevation: 0,
        automaticallyImplyLeading: false,
        // centerTitle: false,
        // leading: const Icon(Icons.arrow_back_ios_new,
        //     color: Color(0xFF774227), size: 18),
        title: const Text('Settings', style: AppTextStyles.header),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          // borderRadius: const BorderRadius.only(
          //     topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: const Color(0xFFFDFAF3),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 18),

              // NEW: Reusable section wrapper (header + collapse)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SettingsSection(
                  iconAsset: sectionIcons1,
                  title: 'General Settings',
                  subtitle: 'All settings related to the app',
                  isExpanded: _isGeneralSettingsExpanded,
                  onToggle: () => setState(() =>
                      _isGeneralSettingsExpanded = !_isGeneralSettingsExpanded),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 18),
                      DropdownField(label: 'App Language', value: 'English'),
                      SizedBox(height: 18),
                      DropdownField(
                          label: 'Translation', value: 'Sahi International'),
                      SizedBox(height: 18),
                      DropdownField(
                          label: 'Word by Word Language', value: 'English'),
                      SizedBox(height: 18),
                      DropdownField(
                          label: 'Default Audio',
                          value: 'Abdul Basit Mujawwad'),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),

              const AppSectionDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SettingsSection(
                  iconAsset: sectionIcons2,
                  title: 'Font Settings',
                  subtitle: 'You can change the font size and font family.',
                  isExpanded: _isFontSettingsExpanded,
                  onToggle: () => setState(
                      () => _isFontSettingsExpanded = !_isFontSettingsExpanded),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const FontPreview(
                          " 'ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَٰلَمِينَ',",
                          "All Praise is for Allah-Lord of all words"),
                      const SizedBox(height: 16),
                      const DropdownField(label: 'Script', value: 'Uthma'),
                      const SizedBox(height: 16),
                      const DropdownField(
                          label: 'Arabic Font', value: 'KFGQ Hafs'),
                      const SizedBox(height: 18),
                      CustomSlider(
                        label: 'Arabic Font Size',
                        value: _arabicFontSize,
                        onChanged: (val) =>
                            setState(() => _arabicFontSize = val),
                      ),
                      const SizedBox(height: 16),
                      CustomSlider(
                        label: 'Translation Font Size',
                        value: _translationFontSize,
                        onChanged: (val) =>
                            setState(() => _translationFontSize = val),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),

              const AppSectionDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SettingsSection(
                  iconAsset: sectionIcons3,
                  title: 'Appearance Settings',
                  subtitle: 'Customzing appearance of the app',
                  isExpanded: _isAppearanceSettingsExpanded,
                  onToggle: () => setState(() => _isAppearanceSettingsExpanded =
                      !_isAppearanceSettingsExpanded),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      SettingsToggle(
                        label: 'Tajweed Color',
                        value: _tajweedColor,
                        onChanged: (val) => setState(() => _tajweedColor = val),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TappableContainer(
                            label: 'Read Tajweed Rules', showArrow: true),
                      ),
                      const SizedBox(height: 15),
                      SettingsToggle(
                        label: 'Keep Screen On',
                        value: _keepScreenOn,
                        onChanged: (val) => setState(() => _keepScreenOn = val),
                      ),
                      const SizedBox(height: 16),
                      const SettingsEntryLabel('Interface Theme'),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 25),
                        child: ThemeSelector(
                          selectedIndex: _selectedThemeIndex,
                          onChanged: (index) =>
                              setState(() => _selectedThemeIndex = index),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),

              // const AppSectionDivider(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 20,
              //   ),
              //   child: Wordbyword(
              //     img: sectionIcons4,
              //     isExpanded: false,
              //     title: "Word By Word",
              //     value: _wordByWord,
              //     onChanged: (val) => setState(() => _wordByWord = val),
              //   ),
              // ),
              // const SizedBox(height: 24),
              const AppSectionDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SettingsSection(
                  iconAsset: sectionIcons4,
                  title: 'Word By Word',
                  subtitle: 'Text change word by word',
                  isExpanded: _isWordByWordExpanded,
                  onToggle: () => setState(
                      () => _isWordByWordExpanded = !_isWordByWordExpanded),
                  child: Column(
                    children: [
                      // SizedBox(height: 18),
                      SettingsToggle(
                        label: 'Word by Word',
                        value: _wordByWord,
                        onChanged: (val) => setState(() => _showArabic = val),
                      ),
                    ],
                  ),
                ),
              ),

              const AppSectionDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SettingsSection(
                  iconAsset: sectionIcons5,
                  title: 'View Settings',
                  subtitle: 'Change the way text is displayed.',
                  isExpanded: _isViewSettingsExpanded,
                  onToggle: () => setState(
                      () => _isViewSettingsExpanded = !_isViewSettingsExpanded),
                  child: Column(
                    children: [
                      const SizedBox(height: 18),
                      SettingsToggle(
                        label: 'Show Arabic',
                        value: _showArabic,
                        onChanged: (val) => setState(() => _showArabic = val),
                      ),
                      const SizedBox(height: 18),
                      SettingsToggle(
                        label: 'Show Translation',
                        value: _showTranslation,
                        onChanged: (val) =>
                            setState(() => _showTranslation = val),
                      ),
                      const SizedBox(height: 18),
                      SettingsToggle(
                        label: 'Show Other Info',
                        value: _showOtherInfo,
                        onChanged: (val) =>
                            setState(() => _showOtherInfo = val),
                      ),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),
              ),

              const AppSectionDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SettingsSection(
                  iconAsset: sectionIcons6,
                  title: 'Notification Settings',
                  subtitle: 'Customize your notifications',
                  isExpanded: _isNotificationSettingsExpanded,
                  onToggle: () => setState(() =>
                      _isNotificationSettingsExpanded =
                          !_isNotificationSettingsExpanded),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      SettingsToggle(
                        label: 'Daily Notification',
                        value: _dailyNotification,
                        onChanged: (val) =>
                            setState(() => _dailyNotification = val),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Set Time',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.containerBackground,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Row(
                                  children: [
                                    Text('5:00 PM',
                                        style: TextStyle(
                                            color: Color(0xFF895737),
                                            fontSize: 14)),
                                    SizedBox(width: 8),
                                    Icon(Icons.keyboard_arrow_down,
                                        color: Color(0xFFB08E76), size: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // const AppSectionDivider(),
              const SizedBox(height: 12),
              MemberCard2(),
            ],
          ),
        ),
      ),
    );
  }
}

class CollapsibleSection extends StatelessWidget {
  final bool isExpanded;
  final Widget child;
  const CollapsibleSection(
      {required this.isExpanded, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    // Smooth expand/collapse with easeInOut without changing public API.
    return ClipRect(
      child: AnimatedAlign(
        alignment: Alignment.topCenter,
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeInOut,
        heightFactor: isExpanded ? 1.0 : 0.0,
        child: child,
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isExpanded;

  const SectionHeader({
    required this.img,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.isExpanded,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // subtitle নিচে বসানোর জন্য
        children: [
          SvgPicture.asset(img, height: 24),
          const SizedBox(width: 22),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14)),
                const SizedBox(height: 4),
                // Subtitle
                // const Text(
                //   "An everyday companion for Muslims on their journey to please Allah!",
                //   style: AppTextStyles.listSubtitle,
                //   maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                // ),
                Text(subtitle,
                    style: AppTextStyles.listSubtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 6),
            child: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: AppColors.primaryBrown,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class Wordbyword extends StatelessWidget {
  final String img;
  final String title;
  final bool isExpanded;
  final bool value;
  final ValueChanged<bool> onChanged;
  final double switchHeight;
  final double switchWidth;

  const Wordbyword({
    required this.img,
    required this.title,
    required this.isExpanded,
    required this.value,
    required this.onChanged,
    this.switchHeight = 28,
    this.switchWidth = 52.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          children: [
            SvgPicture.asset(img, height: 18),
            const SizedBox(width: 20),
            Text(title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14)),
          ],
        ),
        CustomSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF895735),
          inactiveColor: Colors.grey,
        ),
      ],
    );
  }
}

class SettingsEntryLabel extends StatelessWidget {
  final String label;
  const SettingsEntryLabel(this.label, {super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox.shrink(), // kept for API compatibility below
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String value;
  const CustomDropdown({required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.containerBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value,
              style: const TextStyle(
                  color: Color(0xFF79665A),
                  fontSize: 13,
                  fontWeight: FontWeight.w400)),
          const Icon(Icons.keyboard_arrow_down, color: Color(0xFF655248)),
        ],
      ),
    );
  }
}

class FontPreview extends StatelessWidget {
  final String title;
  final String subtitle;
  const FontPreview(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.containerBackground,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(title,
                style: const TextStyle(
                    fontSize: 21,
                    color: Color(0xFF655248),
                    fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 12),
          Text(subtitle,
              style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF79665A),
                  height: 1.5,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  const CustomSlider(
      {required this.label,
      required this.value,
      required this.onChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(label,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w600))),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 6, right: 24),
          child: Row(
            children: [
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 4,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 16.0),
                  ),
                  child: Slider(
                    value: value,
                    min: 10,
                    max: 50,
                    activeColor: AppColors.primaryBrown,
                    inactiveColor: AppColors.sliderInactive,
                    onChanged: onChanged,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(value.toInt().toString(),
                  style: const TextStyle(
                      color: Color(0xFF703607),
                      fontSize: 13,
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ],
    );
  }
}

class SettingsToggle extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final IconData? icon;

  const SettingsToggle(
      {required this.label,
      required this.value,
      required this.onChanged,
      this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: AppColors.primaryBrown, size: 22),
            const SizedBox(width: 8),
          ],
          Text(label,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
          const Spacer(),
          CustomSwitch(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xFF895735),
              inactiveColor: Colors.grey),
        ],
      ),
    );
  }
}

class TappableContainer extends StatelessWidget {
  final String label;
  final bool showArrow;

  const TappableContainer(
      {required this.label, this.showArrow = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.containerBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: const TextStyle(
                    color: Color(0xFF422C1A),
                    fontSize: 13,
                    fontWeight: FontWeight.w400)),
            if (showArrow)
              const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Color(0xFF655248)),
          ],
        ),
      ),
    );
  }
}

class ThemeSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const ThemeSelector(
      {required this.selectedIndex, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    final themes = ['System', 'Light', 'Dark', 'Green', 'Tilt'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(themes.length, (index) {
        return GestureDetector(
          onTap: () => onChanged(index),
          child: ThemeOption(
              label: themes[index], isSelected: selectedIndex == index),
        );
      }),
    );
  }
}

class ThemeOption extends StatelessWidget {
  final String label;
  final bool isSelected;

  const ThemeOption({required this.label, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 54,
              height: 80,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFF8F2EA)
                    : AppColors.containerBackground,
                border: Border.all(
                    color: isSelected
                        ? AppColors.primaryBrown
                        : Colors.transparent,
                    width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            if (isSelected)
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.brown, width: 2)),
                  child: Center(
                    child: Container(
                        width: 9,
                        height: 9,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.brown)),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        Text(label,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 12)),
      ],
    );
  }
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;
  final Color activeColor;
  final Color inactiveColor;
  final Duration duration;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.width = 50,
    this.height = 28,
    this.activeColor = const Color(0xFF895735),
    this.inactiveColor = Colors.grey,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(covariant CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) _value = widget.value;
  }

  void _toggle() {
    setState(() => _value = !_value);
    widget.onChanged(_value);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: widget.duration,
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.height / 2),
          color: _value ? widget.activeColor : widget.inactiveColor,
        ),
        child: AnimatedAlign(
          duration: widget.duration,
          alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: widget.height - 6,
            height: widget.height - 6,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 3,
                    offset: const Offset(0, 2))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class MemberCard extends StatelessWidget {
//   const MemberCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.appBarBackground,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: AppColors.sliderInactive, width: 1),
//       ),
//       padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           const Center(
//               child:
//                   Text('Become a Member', style: AppTextStyles.cardOverline)),
//           const SizedBox(height: 12),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryBrown,
//                   shape: BoxShape.circle,
//                   border: Border.all(color: AppColors.sliderInactive, width: 3),
//                 ),
//                 child: Center(
//                     child: SvgPicture.asset(
//                         'assets/images/svg/duaRuqyah/lovely.svg',
//                         height: 22,
//                         width: 22)),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text('Keep Sadiq Safe from Ads',
//                         style: AppTextStyles.cardHeadline),
//                     const SizedBox(height: 6),
//                     RichText(
//                       text: const TextSpan(
//                         style: AppTextStyles.cardBody,
//                         children: [
//                           TextSpan(
//                               text:
//                                   'Our commitment to keep the Quran Majeed app '),
//                           TextSpan(
//                               text: 'ad-free',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   color: AppColors.listTitle)),
//                           TextSpan(
//                               text:
//                                   ' is possible because of the support of people like you.'),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 14),
//           SizedBox(
//             height: 44,
//             child: InkWell(
//               borderRadius: BorderRadius.circular(28),
//               onTap: () {},
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: AppColors.primaryBrown,
//                     borderRadius: BorderRadius.circular(28)),
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SvgPicture.asset("assets/images/svg/duaRuqyah/Zakat.svg",
//                         width: 20, height: 20, color: Colors.white),
//                     const SizedBox(width: 8),
//                     const Text('Donate Now', style: AppTextStyles.button),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MemberCard2 extends StatelessWidget {
  const MemberCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.appBarBackground,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // const Center(
          //     child:
          //         Text('Become a Member', style: AppTextStyles.cardOverline)),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryBrown,
                  // border: Border.all(color: AppColors.sliderInactive, width: 3),
                  borderRadius: BorderRadius.circular(12), // 8 px corner round
                ),
                child: Center(
                    child: SvgPicture.asset(
                        'assets/images/svg/duaRuqyah/lovely.svg',
                        height: 22,
                        width: 22)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Keep Quran Majeed app Safe from Ads',
                        style: AppTextStyles.cardHeadline),
                    SizedBox(height: 20),
                    // RichText(
                    //   text: const TextSpan(
                    //     style: AppTextStyles.cardBody,
                    //     children: [
                    //       TextSpan(
                    //           text:
                    //               'Our commitment to keep the Quran Majeed app '),
                    //       TextSpan(
                    //           text: 'ad-free',
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w700,
                    //               color: AppColors.listTitle)),
                    //       TextSpan(
                    //           text:
                    //               ' is possible because of the support of people like you.'),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              'He who called (people) to Righteousness, there would be rewards (assured) for him like the rewards of those who adhered to it, without their rewards being diminished in any respect.',
              style: AppTextStyles.cardBody,
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '-Sahih Muslim: 2674',
              style: AppTextStyles.cardBody.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 44,
            child: InkWell(
              borderRadius: BorderRadius.circular(28),
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryBrown,
                    borderRadius: BorderRadius.circular(28)),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/svg/duaRuqyah/Zakat.svg",
                        width: 20, height: 20, color: Colors.white),
                    const SizedBox(width: 8),
                    const Text('Donate Now', style: AppTextStyles.button),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// NEW: Section wrapper = header + collapsible child + default paddings
class SettingsSection extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String subtitle;
  final bool isExpanded;
  final VoidCallback onToggle;
  final Widget child;

  const SettingsSection({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    required this.isExpanded,
    required this.onToggle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 18),
          child: SectionHeader(
              img: iconAsset,
              title: title,
              subtitle: subtitle,
              isExpanded: isExpanded,
              onTap: onToggle),
        ),
        CollapsibleSection(isExpanded: isExpanded, child: child),
      ],
    );
  }
}

// NEW: Compact label + dropdown combo used in multiple places
class DropdownField extends StatelessWidget {
  final String label;
  final String value;
  const DropdownField({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 0),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Text(label,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),
        ),
        CustomDropdown(value: value),
      ],
    );
  }
}

// NEW: Soft divider between top-level sections
class AppSectionDivider extends StatelessWidget {
  const AppSectionDivider({super.key});
  @override
  Widget build(BuildContext context) {
    return Divider(thickness: 1, color: AppColors.dividerSoft);
  }
}
