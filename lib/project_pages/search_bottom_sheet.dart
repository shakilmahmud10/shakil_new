import 'package:flutter/material.dart';

// --- Color Constants ---
const Color darkOliveGreen = Color(0xFF38761D);
const Color veryDarkGray = Color(0xFF333333);
const Color mediumGray = Color(0xFF666666);
const Color lightGray = Color(0xFF999999);
const Color veryLightGray = Color(0xFFF0F0F0);
const Color lightMintGreen = Color(0xFFE8F5E9);
const Color pureWhite = Color(0xFFFFFFFF);

void main() {
  runApp(const HadithApp());
}

class HadithApp extends StatelessWidget {
  const HadithApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al Hadith',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: pureWhite,
      ),
      debugShowCheckedModeBanner: false,
      home: const BottomSheetSearch(),
    );
  }
}

class BottomSheetSearch extends StatelessWidget {
  const BottomSheetSearch({super.key});

  // Method to show the bottom sheet
  void _showSearchModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        // This makes the sheet content take 80% of the screen height
        return SearchBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: darkOliveGreen,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showSearchModal(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: darkOliveGreen,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: const Text("Search Bottom Sheet"),
        ),
      ),
    );
  }
}

// --- Search Modal Bottom Sheet (Unchanged as requested) ---

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  bool _isFilterPanelVisible = false;
  int _radioValue = 2; // Default to 'Partial Match' as seen in the video
  // New state variables add korun
  int _searchInValue = 0; // 0=Translation, 1=Tafsir, 2=Arabic
  int _searchTypeValue = 1; // 0=Exact, 1=Partial

  void _toggleFilterPanel() {
    setState(() {
      _isFilterPanelVisible = !_isFilterPanelVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: pureWhite, // White background
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0,
                20.0 + MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildSheetSearchBar(),
                const SizedBox(height: 24.0),

                // এই AnimatedSize উইজেটটি যোগ করুন
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut, // একটি সুন্দর অ্যানিমেশন কার্ভ
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    // ... transitionBuilder আগের মতোই থাকবে
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      final isFilterPanel =
                          child.key == const ValueKey('filter_panel');

                      final offsetAnimation = Tween<Offset>(
                        begin: isFilterPanel
                            ? const Offset(0.5, 0.0)
                            : const Offset(-0.5, 0.0),
                        end: Offset.zero,
                      ).animate(animation);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    child: _isFilterPanelVisible
                        ? _buildFilterPanelView()
                        : _buildSearchPanelView(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSheetSearchBar() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: "হাদিস সার্চ করুন",
        prefixIcon: const Icon(Icons.search, color: mediumGray),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.tune_sharp,
            // Change color when filter is open
            color: _isFilterPanelVisible ? darkOliveGreen : mediumGray,
          ),
          onPressed: _toggleFilterPanel,
        ),
        filled: false,
        // Bottom underline border
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: lightGray, width: 0.5),
        ),
        // Green underline when focused
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: lightGray, width: 0.5),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: lightGray, width: 0.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
      ),
      style: const TextStyle(color: veryDarkGray, fontSize: 16),
    );
  }

  Widget _buildSearchPanelView() {
    final navChips = [
      "সহীহ বুখারী",
      "সুনানে আবু দাউদ: ৩০০০",
      "সহীহ মুসলিম",
      "১০০ টি হাদিস"
    ];

    final history = [
      "আমার উম্মত হতে যত সংখ্যক লোক জান্নাতে প্রবেশ করবে।",
      "তিন জন লোকের গুহায় আশ্রয় নেবার ঘটনা",
      "নিরানব্বইটি মানুষ হত্যা ও আল্লাহর ক্ষমা",
      "যাবতীয় পছন্দনীয় আমল"
    ];

    return Column(
      // Unique key for AnimatedSwitcher
      key: const ValueKey('search_panel'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("নেভিগেটের চেষ্টা করুন",
            style: TextStyle(color: mediumGray)),
        const SizedBox(height: 12.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: navChips.map((label) => _buildPanelChip(label)).toList(),
        ),
        const SizedBox(height: 24.0),
        const Text("সার্চ হিস্ট্রি", style: TextStyle(color: mediumGray)),
        const SizedBox(height: 8.0),
        Column(
          children: history
              .map((item) => ListTile(
                    leading: const Icon(Icons.arrow_forward_sharp,
                        size: 20.0, color: mediumGray),
                    title: Text(item,
                        style: const TextStyle(color: veryDarkGray),
                        overflow: TextOverflow.ellipsis),
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    onTap: () {},
                  ))
              .toList(),
        )
      ],
    );
  }

  Widget _buildFilterPanelView() {
    return Column(
      key: const ValueKey('filter_panel'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row te 2ta section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search In section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Search In",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: veryDarkGray,
                          fontSize: 14)),
                  const SizedBox(height: 8.0),
                  _buildSearchInRadio("Translation Match", 0),
                  _buildSearchInRadio("Tafsir Match", 1),
                  _buildSearchInRadio("Arabic Match", 2),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            // Select Search Type section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Select Search Type",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: veryDarkGray,
                          fontSize: 14)),
                  const SizedBox(height: 8.0),
                  _buildSearchTypeRadio("Exact Match", 0),
                  _buildSearchTypeRadio("Partial Match", 1),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        const Text("হাদিস গ্রন্থসমূহ সিলেক্ট করুন",
            style: TextStyle(fontWeight: FontWeight.bold, color: veryDarkGray)),
        const SizedBox(height: 8.0),
        _buildDropdown("বই সিলেক্ট করুন"),
        const SizedBox(height: 16.0),
        const Text("তাহকিক সিলেক্ট করুন",
            style: TextStyle(fontWeight: FontWeight.bold, color: veryDarkGray)),
        const SizedBox(height: 8.0),
        _buildDropdown("তাহকিক সিলেক্ট করুন"),
        const SizedBox(height: 26.0),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFFE7E7E7),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text("ক্যান্সেল"),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFF4F8B34),
                  foregroundColor: pureWhite,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text("অ্যাপ্লাই"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPanelChip(String label) {
    return ActionChip(
      label: Text(label),
      onPressed: () {},
      backgroundColor: veryLightGray,
      labelStyle: const TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.transparent),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  Widget _buildSearchInRadio(String title, int value) {
    return Row(
      children: [
        Radio<int>(
          value: value,
          groupValue: _searchInValue,
          onChanged: (int? newValue) {
            setState(() => _searchInValue = newValue!);
          },
          activeColor: darkOliveGreen,
          fillColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.selected)) {
              return darkOliveGreen;
            }
            return mediumGray;
          }),
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() => _searchInValue = value);
            },
            child: Text(
              title,
              style: const TextStyle(color: veryDarkGray, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchTypeRadio(String title, int value) {
    return Row(
      children: [
        Radio<int>(
          value: value,
          groupValue: _searchTypeValue,
          onChanged: (int? newValue) {
            setState(() => _searchTypeValue = newValue!);
          },
          activeColor: darkOliveGreen,
          fillColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.selected)) {
              return darkOliveGreen;
            }
            return mediumGray;
          }),
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() => _searchTypeValue = value);
            },
            child: Text(
              title,
              style: const TextStyle(color: veryDarkGray, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String hint) {
    return DropdownButtonFormField<String>(
      hint: Text(hint, style: const TextStyle(color: mediumGray)),
      icon: const Icon(Icons.keyboard_arrow_down, color: mediumGray),
      decoration: InputDecoration(
        filled: true,
        fillColor: veryLightGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
      ),
      items: const [], // Dummy items list
      onChanged: (value) {},
    );
  }
}
