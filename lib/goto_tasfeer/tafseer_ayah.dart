import 'package:flutter/material.dart';


// --- Color Constants (Approximated from the image) ---
class AppColors {
  static const Color primaryDarkBackground = Color(
    0xFF3A327B,
  ); // Deep Purple/Blue background color
  static const Color mainCardBackground = Color(
    0xFFF7F9FC,
  ); // Very light card background
  static const Color titleText = Color(
    0xFF2F2F3E,
  ); // Dark text color for titles
  static const Color inputLabel = Color(
    0xFF6A6A7A,
  ); // Subdued text color for labels/inactive items
  static const Color selectedItemBackground = Color(
    0xFFD9F3E1,
  ); // Light green for selected item
  static const Color selectedItemText = Color(
    0xFF2F2F3E,
  ); // Dark text for selected item
  static const Color selectedItemNumber = Color(
    0xFF19A75D,
  ); // Green for the Ayah number in selected item
  static const Color buttonColor = Color(
    0xFF19A75D,
  ); // Green for the action buttons
}

// --- Data Model ---
class SurahItem {
  final String name;
  final String ayahNumber;

  SurahItem({required this.name, required this.ayahNumber});
}

// --- Mock Data based on the image ---
final List<SurahItem> surahList = [
  SurahItem(name: '2. Al Baqarah', ayahNumber: '2'),
  SurahItem(name: '2. Al Baqarah', ayahNumber: '2'),
  SurahItem(name: '2. Al Baqarah', ayahNumber: '2'),
  SurahItem(name: '2. Al Baqarah', ayahNumber: '2'),
  // This item is at index 4, which will be our initial selected index
  SurahItem(name: '1. Al Fatiha', ayahNumber: '1'),
  SurahItem(name: '2. Al Baqarah', ayahNumber: '2'),
  SurahItem(name: '2. Al Baqarah', ayahNumber: '2'),
  SurahItem(name: '2. Al Baqarah', ayahNumber: '2'),
  SurahItem(name: '2. Al Baqarah', ayahNumber: '2'),
  SurahItem(name: '3. Ali Imran', ayahNumber: '3'),
  SurahItem(name: '3. Ali Imran', ayahNumber: '3'),
  SurahItem(name: '3. Ali Imran', ayahNumber: '3'),
];

// --- Main App Widget ---
class QuranSearchApp extends StatelessWidget {
  const QuranSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran Search',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Roboto'),
      home: const QuranSearchScreen(),
    );
  }
}

// --- Screen Widget (Stateful to manage the selected item) ---
class QuranSearchScreen extends StatefulWidget {
  const QuranSearchScreen({super.key});

  @override
  State<QuranSearchScreen> createState() => _QuranSearchScreenState();
}

class _QuranSearchScreenState extends State<QuranSearchScreen> {
  int _selectedIndex = 4; // Initial index for "1. Al Fatiha"
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(
      initialItem: _selectedIndex,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDarkBackground,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainCardBackground,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24.0),
                _buildSearchTabs(),
                const SizedBox(height: 16.0),
                _buildSurahList(),
                const SizedBox(height: 20.0),
                _buildActionButtons(),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget for the list of Surahs with corrected styling
  Widget _buildSurahList() {
    return SizedBox(
      height: 300,
      child: ListWheelScrollView.useDelegate(
        controller: _scrollController,
        itemExtent: 50,
        perspective: 0.004,
        diameterRatio: 2.5,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: surahList.length,
          builder: (context, index) {
            final item = surahList[index];
            final bool isSelected = index == _selectedIndex;
            final double distanceFromCenter = (_selectedIndex - index)
                .abs()
                .toDouble();

            // Calculate opacity based on distance
            final double opacity = (1.0 - (distanceFromCenter * 0.2)).clamp(
              0.3,
              1.0,
            );

            // Define colors for name and number
            final Color nameColor = isSelected
                ? AppColors.selectedItemText
                : Color(0xFF9E9E9E).withOpacity(opacity);

            final Color numberColor = isSelected
                ? AppColors.selectedItemNumber
                : Color(0xFFBDBDBD).withOpacity(opacity);

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                  _scrollController.animateToItem(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.selectedItemBackground
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: nameColor,
                      ),
                    ),
                    Text(
                      item.ayahNumber,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w400,
                        color: numberColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearchTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  'Search Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.titleText,
                  ),
                ),
                const SizedBox(height: 4.0),
                Container(height: 2.0, color: AppColors.buttonColor),
              ],
            ),
          ),
          const SizedBox(width: 30.0),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Type Ayah',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.inputLabel,
                  ),
                ),
                const SizedBox(height: 6.0),
                Container(
                  height: 1.0,
                  color: AppColors.inputLabel.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _buildActionButton(text: 'Go to Tafsiir', onPressed: () {}),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: _buildActionButton(text: 'Go to Ayah', onPressed: () {}),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
