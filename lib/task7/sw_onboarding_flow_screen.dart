import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/colors.dart';
import '../widgets/style.dart';
import '../widgets/images.dart';
import 'models/sw_onboarding_data.dart';

class SwOnboardingFlowScreen extends StatefulWidget {
  const SwOnboardingFlowScreen({super.key});

  @override
  State<SwOnboardingFlowScreen> createState() => _SwOnboardingFlowScreenState();
}

class _SwOnboardingFlowScreenState extends State<SwOnboardingFlowScreen>
    with WidgetsBindingObserver {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  Timer? _navigationBarTimer;
  String selectedMadhab = 'Hanafi';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _setupStatusBar();
  }

  @override
  void dispose() {
    _navigationBarTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _setupStatusBar();
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _startNavigationBarHideTimer();
  }

  void _setupStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ));
    _startNavigationBarHideTimer();
  }

  void _startNavigationBarHideTimer() {
    _navigationBarTimer?.cancel();
    _navigationBarTimer = Timer(const Duration(milliseconds: 1000), () {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top],
      );
    });
  }

  void _nextPage() {
    if (_currentPageIndex < SwOnboardingData.pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Last page - return to main menu
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF01041F),
          gradient: swsplashBGGradient1,
        ),
        child: SafeArea(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            itemCount: SwOnboardingData.pages.length,
            itemBuilder: (context, index) {
              final pageData = SwOnboardingData.pages[index];
              return _buildOnboardingPage(pageData);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(SwOnboardingPageData pageData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Spacer(flex: 6),
          SwContentDisplay(
            pageData: pageData,
            selectedMadhab: selectedMadhab,
            onMadhabChanged: (madhab) {
              setState(() {
                selectedMadhab = madhab;
              });
            },
            onButtonPressed: () {
              _startNavigationBarHideTimer();
              _nextPage();
            },
          ),
          const Spacer(flex: 9),
          SwPageIndicator(currentPageIndex: _currentPageIndex),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}

class SwContentDisplay extends StatelessWidget {
  final SwOnboardingPageData pageData;
  final String selectedMadhab;
  final Function(String) onMadhabChanged;
  final VoidCallback onButtonPressed;

  const SwContentDisplay({
    super.key,
    required this.pageData,
    required this.selectedMadhab,
    required this.onMadhabChanged,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          pageData.title,
          style: swheadline,
        ),
        const SizedBox(height: 8.0),
        Text(
          pageData.subtitle,
          style: swsubtitle,
        ),
        const SizedBox(height: 60.0),
        if (pageData.svgIcon != null) SvgPicture.asset(pageData.svgIcon!),
        const SizedBox(height: 50),

        // Different content based on page type
        if (pageData.isLocationPage) ...[
          Text(
            pageData.description,
            textAlign: TextAlign.center,
            style: swbody,
          ),
        ] else if (pageData.isMadhabPage) ...[
          SwSelectableList(
            options: pageData.madhabOptions!,
            selectedOption: selectedMadhab,
            onSelectionChanged: onMadhabChanged,
          ),
        ] else if (pageData.isNotificationPage) ...[
          SwNotificationToggleCard(
            title: 'Enable Notifications',
            subtitle: 'Enable notifications to get updates',
            onChanged: (val) {
              print("Notifications toggled: $val");
            },
          ),
        ],

        const SizedBox(height: 40),
        SwGradientButton(
          text: pageData.buttonText,
          onPressed: onButtonPressed,
        ),
      ],
    );
  }
}

class SwGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SwGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6FACF2),
            Color(0xFF3288ED),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 18),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
        ),
        child: Text(
          text,
          style: swbutton,
        ),
      ),
    );
  }
}

class SwPageIndicator extends StatelessWidget {
  final int currentPageIndex;

  const SwPageIndicator({
    super.key,
    required this.currentPageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SwIndicator(isActive: currentPageIndex == 0),
        const SizedBox(width: 8),
        SwIndicator(isActive: currentPageIndex == 1),
        const SizedBox(width: 8),
        SwIndicator(isActive: currentPageIndex == 2),
      ],
    );
  }
}

class SwIndicator extends StatelessWidget {
  final bool isActive;

  const SwIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.0,
      width: isActive ? 80.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? swHeaderTextColor : indicatorNotActive,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

class SwSelectableList extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final Function(String) onSelectionChanged;

  const SwSelectableList({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: const Color(0xFF202A3A),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(options.length, (index) {
            final isSelected = selectedOption == options[index];
            final optionText = options[index];

            return _buildOptionItem(
              text: optionText,
              isSelected: isSelected,
              onTap: () {
                if (selectedOption != optionText) {
                  onSelectionChanged(optionText);
                }
              },
            );
          }),
        ),
      ),
    );
  }

  Widget _buildOptionItem({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: isSelected ? const Color(0xFF1a2f49) : const Color(0xFF142130),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20.0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFFC1DBFA),
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              if (isSelected)
                const Icon(
                  Icons.check,
                  color: Color(0xFF516378),
                  size: 20.0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SwNotificationToggleCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const SwNotificationToggleCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.initialValue = false,
    required this.onChanged,
  });

  @override
  State<SwNotificationToggleCard> createState() =>
      _SwNotificationToggleCardState();
}

class _SwNotificationToggleCardState extends State<SwNotificationToggleCard> {
  late bool isToggled;

  @override
  void initState() {
    super.initState();
    isToggled = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1A2B),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFC1DBFA),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFFC1DBFA).withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SwCustomToggle(
            initialValue: isToggled,
            onChanged: (value) {
              setState(() {
                isToggled = value;
              });
              widget.onChanged(value);
            },
          ),
        ],
      ),
    );
  }
}

class SwCustomToggle extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const SwCustomToggle({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<SwCustomToggle> createState() => _SwCustomToggleState();
}

class _SwCustomToggleState extends State<SwCustomToggle>
    with SingleTickerProviderStateMixin {
  late bool _isOn;

  @override
  void initState() {
    super.initState();
    _isOn = widget.initialValue;
  }

  void _toggle() {
    setState(() {
      _isOn = !_isOn;
    });
    widget.onChanged(_isOn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 44,
        height: 25,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
            color: _isOn ? Colors.blue : Colors.grey.shade600,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          alignment: _isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: _isOn ? Colors.blue : Colors.grey.shade600,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
