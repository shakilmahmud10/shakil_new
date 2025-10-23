import 'package:flutter/material.dart';

// --- Color Constants (Color Palette) ---
// Primary Color: darkOliveGreen
const Color primaryColor = Color(0xFF38761D);
// Secondary Color: veryDarkGray (Text/Icon)
const Color secondaryColor = Color(0xFF333333);
// PureWhite
const Color pureWhite = Color(0xFFFFFFFF);
// Grey1 (mediumGray)
const Color grey1 = Color(0xFF666666);
// Light Gray (For borders/dividers)
const Color lightGray = Color(0xFF999999);
// 3rd Color / Background Fill (veryLightGray)
const Color backgroundFill = Color(0xFFF0F0F0);
// lightMintGreen (Unused, removed for simplicity, but kept for reference)
// const Color lightMintGreen = Color(0xFFE8F5E9);

// Old names mapped to new names for consistency
const Color darkOliveGreen = primaryColor;
const Color veryDarkGray = secondaryColor;
const Color mediumGray = grey1;
const Color veryLightGray = backgroundFill;

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
        // Primary Swatch updated to use the primaryColor
        primaryColor: primaryColor,
        scaffoldBackgroundColor: pureWhite,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          primary: primaryColor,
          secondary: primaryColor, // Secondary color often matches primary
        ),
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
      // Sheet content will automatically be responsive due to isScrollControlled: true
      builder: (context) {
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

// --- Search Modal Bottom Sheet ---

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  bool _isFilterPanelVisible = false;
  int _searchInValue = 0; // 0=Translation, 1=Tafsir, 2=Arabic
  int _searchTypeValue = 1; // 0=Exact, 1=Partial

  // *** 1. পরিবর্তন: ড্রপডাউনের সিলেক্টেড ভ্যালু সংরক্ষণের জন্য নতুন state ভ্যারিয়েবল। ***
  // এগুলিকে nullable (String?) রাখা হয়েছে কারণ প্রথমে কোনো আইটেম সিলেক্ট করা থাকে না।
  String? _selectedBook;
  String? _selectedTafsir;

  // History list state variable for deletion
  final List<String> _historyList = [
    "আমার উম্মত হতে যত সংখ্যক লোক জান্নাতে প্রবেশ করবে তার বর্ণনা।",
    "তিন জন লোকের গুহায় আশ্রয় নেবার সেই বিখ্যাত এবং শিক্ষণীয় ঘটনা",
    "নিরানব্বইটি মানুষ হত্যা ও আল্লাহর ক্ষমা",
    "যাবতীয় পছন্দনীয় আমল"
  ];

  void _toggleFilterPanel() {
    setState(() {
      _isFilterPanelVisible = !_isFilterPanelVisible;
    });
  }

  // Helper Method for Truncation
  String _getDisplayHistoryText(String text) {
    const int maxLength = 50;
    const int truncationLength = 40;
    if (text.length > maxLength) {
      return '${text.substring(0, truncationLength)}...';
    }
    return text;
  }

  // Helper Method for Deleting History Item
  void _deleteHistoryItem(String itemToRemove) {
    setState(() {
      _historyList.remove(itemToRemove);
    });
  }

  @override
  Widget build(BuildContext context) {
    // build মেথডে কোনো পরিবর্তন নেই...
    return Container(
      decoration: const BoxDecoration(
        color: pureWhite,
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
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
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

  // >>> নিচের মেথডগুলোতে কোনো পরিবর্তন করা হয়নি
  Widget _buildSheetSearchBar() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Find wisdome if the Quran",
        prefixIcon: const Icon(Icons.search, color: mediumGray),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.tune_sharp,
            color: _isFilterPanelVisible ? darkOliveGreen : mediumGray,
          ),
          onPressed: _toggleFilterPanel,
        ),
        filled: false,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: lightGray, width: 0.5),
        ),
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
    final navChips = ["Al-Fatiha", "Juz 30", "Surah Yasin", "Page 1"];

    return Column(
      key: const ValueKey('search_panel'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Try to Navigate", style: TextStyle(color: mediumGray)),
        const SizedBox(height: 12.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: navChips.map((label) => _buildPanelChip(label)).toList(),
        ),
        const SizedBox(height: 24.0),
        const Text("Search History", style: TextStyle(color: mediumGray)),
        const SizedBox(height: 8.0),
        Column(
          children: _historyList.map((item) {
            final displayText = _getDisplayHistoryText(item);

            return ListTile(
              leading: const Icon(Icons.arrow_forward_sharp,
                  size: 20.0, color: mediumGray),
              title: Text(
                displayText,
                style: const TextStyle(color: veryDarkGray),
                maxLines: 1,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.close, color: mediumGray, size: 20.0),
                onPressed: () {
                  _deleteHistoryItem(item);
                },
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.all(8.0),
                splashRadius: 20.0,
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              onTap: () {},
            );
          }).toList(),
        )
      ],
    );
  }

  // --- মেথডগুলোতে পরিবর্তন করা হয়েছে ---

  Widget _buildFilterPanelView() {
    // *** 2. পরিবর্তন: ড্রপডাউনের জন্য ডামি ডেটা লিস্ট তৈরি করা হয়েছে। ***
    final List<String> bookItems = [
      'সহীহ বুখারী',
      'সহীহ মুসলিম',
      'সুনানে আবু দাউদ',
      'জামে আত-তিরমিযী'
    ];
    final List<String> tafsirItems = [
      'তাফসীর ইবনে কাসীর',
      'তাফসীরে জালালাইন',
      'তাফসীর আল-তাবারি',
      'ফী যিলালিল কোরআন'
    ];

    return Column(
      key: const ValueKey('filter_panel'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Search In",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Select Search Type",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
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
        // আপনার পুরোনো কোডে 'Search by Surah' ছিল, আমি এটিকে আগের 'হাদিস গ্রন্থসমূহ...' দিয়ে প্রতিস্থাপন করেছি।
        const Text("হাদিস গ্রন্থসমূহ সিলেক্ট করুন",
            style: TextStyle(fontWeight: FontWeight.w500, color: veryDarkGray)),
        const SizedBox(height: 8.0),

        // *** 3. পরিবর্তন: _buildDropdown মেথডে নতুন প্যারামিটার পাস করা হয়েছে। ***
        _buildDropdown(
          hint: "বই সিলেক্ট করুন",
          value: _selectedBook,
          items: bookItems,
          onChanged: (newValue) {
            // setState ব্যবহার করে সিলেক্টেড বইয়ের ভ্যালু আপডেট করা হচ্ছে।
            setState(() {
              _selectedBook = newValue;
            });
          },
        ),

        const SizedBox(height: 16.0),
        // আপনার পুরোনো কোডে 'Tafsir Select' ছিল, আমি এটিকে আগের 'তাহকিক সিলেক্ট...' দিয়ে প্রতিস্থাপন করেছি।
        const Text("তাহকিক সিলেক্ট করুন",
            style: TextStyle(fontWeight: FontWeight.w500, color: veryDarkGray)),
        const SizedBox(height: 8.0),

        // *** 4. পরিবর্তন: দ্বিতীয় ড্রপডাউনের জন্যেও একই কাজ করা হয়েছে। ***
        _buildDropdown(
          hint: "তাফসীর সিলেক্ট করুন",
          value: _selectedTafsir,
          items: tafsirItems,
          onChanged: (newValue) {
            // setState ব্যবহার করে সিলেক্টেড তাফসীরের ভ্যালু আপডেট করা হচ্ছে।
            setState(() {
              _selectedTafsir = newValue;
            });
          },
        ),

        const SizedBox(height: 26.0),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: backgroundFill,
                  foregroundColor: veryDarkGray,
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
                  backgroundColor: primaryColor,
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

  // >>> নিচের মেথডগুলোতে কোনো পরিবর্তন করা হয়নি
  Widget _buildPanelChip(String label) {
    return ActionChip(
      label: Text(label),
      onPressed: () {},
      backgroundColor: veryLightGray,
      labelStyle: const TextStyle(color: mediumGray),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: Colors.transparent),
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

  // *** 5. পরিবর্তন: _buildDropdown মেথডটি state পরিচালনার জন্য আপডেট করা হয়েছে। ***
  /// এটি এখন hint, value, item list এবং onChanged ফাংশন প্যারামিটার হিসেবে গ্রহণ করে।
  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      // Style for the dropdown menu itself
      dropdownColor: pureWhite,
      hint: Text(hint, style: const TextStyle(color: mediumGray)),
      icon: const Icon(Icons.keyboard_arrow_down, color: mediumGray),
      // The currently selected value
      value: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: veryLightGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
      ),
      // আইটেম লিস্ট ম্যাপ করে DropdownMenuItem তৈরি করা হচ্ছে।
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            // ড্রপডাউন আইটেমের টেক্সট স্টাইল।
            style: const TextStyle(
              color: veryDarkGray, // Main text color
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
      // যখন একটি নতুন আইটেম সিলেক্ট করা হয়, তখন এই ফাংশন কল হয়।
      onChanged: onChanged,
    );
  }
}
