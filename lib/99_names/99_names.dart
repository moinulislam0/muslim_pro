import 'package:flutter/material.dart';

// --- Color Constants (Approximated/Placeholder) ---
class AsmaColors {
  // Colors extracted/approximated from the image
  static const Color scaffoldBackground = Color(
    0xFFF5F7FA,
  ); // Very light background
  static const Color cardBackground = Colors.white;
  static const Color badgeColor = Color(
    0xFFebf7f3,
  ); // Light teal/mint for the number badge
  static const Color arabicText = Color(
    0xFF36b084,
  ); // Dark grey/blue for Arabic text
  static const Color englishTextBold = Color(0XFF3d4953);
  static const Color englishTextSubtitle = Color(
    0xFF3d4953,
  ); // Lighter grey/blue for the meaning
}

class NameEntry {
  final int number;
  final String arabic;
  final String englishTransliteration;
  final String englishMeaning;

  const NameEntry({
    required this.number,
    required this.arabic,
    required this.englishTransliteration,
    required this.englishMeaning,
  });
}

// --- Data Source (First 8 names shown) ---
const List<NameEntry> asmaulHusnaData = [
  NameEntry(
    number: 1,
    arabic: 'الرحمن',
    englishTransliteration: 'Ar Rahman',
    englishMeaning: 'The Most Gracious',
  ),
  NameEntry(
    number: 2,
    arabic: 'الرحيم',
    englishTransliteration: 'Ar Raheem',
    englishMeaning: 'The Most Merciful',
  ),
  NameEntry(
    number: 3,
    arabic: 'الملك',
    englishTransliteration: 'Al Malik',
    englishMeaning: 'The King',
  ),
  NameEntry(
    number: 4,
    arabic: 'القدوس',
    englishTransliteration: 'Al Quddus',
    englishMeaning: 'The Most Holy',
  ),
  NameEntry(
    number: 5,
    arabic: 'السلام',
    englishTransliteration: 'As Salam',
    englishMeaning: 'The Ultimate Provider of Peace',
  ),
  NameEntry(
    number: 6,
    arabic: 'المؤمن',
    englishTransliteration: 'Al Mu\'min',
    englishMeaning: 'The Guardian of Faith',
  ),
  NameEntry(
    number: 7,
    arabic: 'المهيمن',
    englishTransliteration: 'Al Muhaymin',
    englishMeaning: 'The Guardian, the Preserver',
  ),
  NameEntry(
    number: 8,
    arabic: 'العزيز',
    englishTransliteration: 'Al Aziz',
    englishMeaning: 'The Almighty, the Self Sufficient',
  ),
];

class AsmaCard extends StatelessWidget {
  final NameEntry entry;

  const AsmaCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: AsmaColors.cardBackground,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Number Badge
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AsmaColors.badgeColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '${entry.number}',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w700,
                  color: AsmaColors.arabicText,
                ),
              ),
            ),

            const Spacer(),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                entry.arabic,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 19,

                  fontWeight: FontWeight.w600,
                  color: Color(0XFF3d4953),
                ),
              ),
            ),

            const SizedBox(height: 18.0),

            Text(
              entry.englishTransliteration,
              style: TextStyle(
                fontFamily: "poppins",
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AsmaColors.englishTextBold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              entry.englishMeaning,
              style: TextStyle(
                fontSize: 12,
                fontFamily: "poppins",
                color: AsmaColors.englishTextBold,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AsmaulHusnaScreen extends StatelessWidget {
  const AsmaulHusnaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFf4f4f4),
      appBar: AppBar(
        backgroundColor: AsmaColors.cardBackground,
        elevation: 0,
        title: const Text(
          'Asma ul Husna', // Assuming a title for context
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AsmaColors.arabicText,
          ),
        ),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 4, left: 3, bottom: 80),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.96,
            crossAxisSpacing: 1,
            mainAxisSpacing: 0,
          ),
          itemCount: asmaulHusnaData.length,
          itemBuilder: (context, index) {
            return AsmaCard(entry: asmaulHusnaData[index]);
          },
        ),
      ),
    );
  }
}
