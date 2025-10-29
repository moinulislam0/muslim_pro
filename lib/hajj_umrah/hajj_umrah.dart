import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

// --- Color Constants (Estimated based on visual appearance) ---
class AppColors {
  static const Color appBarBackground = Colors.white;
  static const Color appBarText = Color(0xFF212121); // Dark text for title
  static const Color mainBackground = Color(
    0xFFF5F5F5,
  ); // Light gray background behind cards
  static const Color cardBackground = Colors.white;
  static const Color iconActiveColor = Color(
    0xFF00A884,
  ); // Teal/Green for active icons
  static const Color iconLabelText = Color(
    0xFF616161,
  ); // Medium Gray for labels
  static const Color sadaqahBannerBg = Color(
    0xFFE0F2F1,
  ); // Very light teal/mint for banner background
  static const Color sadaqahButtonBg = Color(
    0xFF00A884,
  ); // Teal/Green for button
  static const Color sadaqahButtonText = Colors.white;
}

// --- Data Model ---
class HajjUmrahCategory {
  final String title;
  // IconData theke String e poriborton kora hoyeche SVG asset path rakhar jonno
  final String image;
  final Color iconColor;

  HajjUmrahCategory({
    required this.title,
    required this.image, // ekhon 'image'
    required this.iconColor,
  });
}

// --- Dummy Data (Corrected) ---
// Proti-ta 'icon' ke 'image' diye replace kora hoyeche ebong placeholder path deya hoyeche
final List<HajjUmrahCategory> categories = [
  HajjUmrahCategory(
    title: 'Kitabul Hajj',
    image: 'assets/images/kitabul.svg', // Placeholder path
    iconColor: const Color(0xFF795548),
  ),
  HajjUmrahCategory(
    title: 'Illustrated Hajj',
    image:
        'assets/images/illustrated_hajj.svg', // Missing value thik kora hoyeche
    iconColor: const Color(0xFF9E9E9E),
  ),
  HajjUmrahCategory(
    title: 'Umrah',
    image: 'assets/images/umrah.svg', // Placeholder path
    iconColor: const Color(0xFF795548),
  ),
  HajjUmrahCategory(
    title: 'Illustrated Umrah',
    image: 'assets/images/illustrated_umrah.svg', // Placeholder path
    iconColor: const Color(0xFF795548),
  ),
  HajjUmrahCategory(
    title: 'Dua',
    image: 'assets/images/dua.svg', // Placeholder path
    iconColor: const Color(0xFF9E9E9E),
  ),
  HajjUmrahCategory(
    title: 'Hadith',
    image: 'assets/images/hadith.svg', // Placeholder path
    iconColor: const Color(0xFF4CAF50),
  ),
  HajjUmrahCategory(
    title: 'Masail',
    image: 'assets/images/masail.svg', // Placeholder path
    iconColor: const Color(0xFFFFC107),
  ),
  HajjUmrahCategory(
    title: 'Qitab',
    image: 'assets/images/qitab.svg', // Placeholder path
    iconColor: const Color(0xFF9C27B0),
  ),
  HajjUmrahCategory(
    title: 'Hajj Videos',
    image: 'assets/images/hajj_video.svg', // Placeholder path
    iconColor: const Color(0xFFFF9800),
  ),
];

// --- Reusable Widgets ---

/// Widget for the Top App Bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(75);

  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: AppColors.appBarBackground,
      elevation: 0,
      title: const Text(
        'Hajj & Umrah',
        style: TextStyle(
          color: Color(0XFF3d4953),
          fontFamily: "poppins",
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.appBarText),
        onPressed: () {
          // Handle back navigation
        },
      ),
    );
  }
}

/// Placeholder Widget for the Custom Illustration Banner
class IllustrationBanner extends StatelessWidget {
  const IllustrationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: Container(
        height: 170.0,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset("assets/images/banner_1.png", fit: BoxFit.contain),
        ),
      ),
    );
  }
}

/// Widget for the individual category icon and label
class CategoryItem extends StatelessWidget {
  final HajjUmrahCategory category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 14.0),
          // Icon Placeholder (Mimicking the flat, colored illustration style)
          SizedBox(
            // Container ke SizedBox diye replace kora holo better practice hishebe
            width: 50.0, // Estimated icon container size
            height: 50.0,
            child: SvgPicture.asset(
              category.image, // Ekhon 'image' property-ti pawa jacche
              width: 28.0,
              height: 28.0,
              fit: BoxFit.contain,
              placeholderBuilder: (BuildContext context) => const Icon(
                Icons.image_not_supported,
                size: 28.0,
                color: AppColors.iconLabelText,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          // Label Text
          Text(
            category.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 55, 66, 75),
              fontFamily: 'roboto',
              fontSize: 14.0, // Small font size
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget for the Sadaqah Jariyah Banner
class SadaqahBanner extends StatelessWidget {
  const SadaqahBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.only(left: 16, right: 10, top: 10, bottom: 8),
      decoration: BoxDecoration(
        color: Color(0xFFc9f4e5),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BE A PART OF',
                  style: TextStyle(
                    color: Color(0XFF3d4953),
                    fontSize: 21.0,
                    fontWeight: FontWeight.w800,
                    fontFamily: "poppins",
                  ),
                ),

                Text(
                  'SADAQAH JARIYAH',
                  style: TextStyle(
                    color: AppColors.sadaqahButtonBg,
                    fontSize: 21.0, // Large, bold text
                    fontWeight: FontWeight.w700,
                    fontFamily: "poppins", // Extra bold
                  ),
                ),
                const SizedBox(height: 20.0),
                // Button
                Container(
                  width: 190,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle support action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFF36b084),
                      foregroundColor: Color.fromARGB(255, 255, 255, 255),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'I Want To Support',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: .0),
                        Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Illustration Placeholder (Mosque/Palm Tree)
          // In a real app, this would be an Image.asset widget.
          Container(
            width: 160,
            height: 150,

            child: Center(
              child: SvgPicture.asset(
                'assets/images/sadaqah.svg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Main Screen ---
class HajjUmrahScreen extends StatelessWidget {
  const HajjUmrahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.mainBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 8.0),
          children: [
            SizedBox(height: 10),
            // 1. Illustration Banner
            const IllustrationBanner(),

            // 2. Category Grid Card
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                // NOTE: The fixed height might still create extra empty space at the bottom.
                // Consider removing the height or adjusting it based on the item count.
                height: 380,
                width: 150,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Important for nested scroll views
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0.0,
                    // --- PORIBORTON EKHANE ---
                    mainAxisSpacing:
                        4.0, // Row gulo'r majhe halka gap deyar jonno.
                    childAspectRatio:
                        1.1, // Item-ke choto kore gap komano'r jonno.
                    // --- PORIBORTON SHESH ---
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryItem(category: categories[index]);
                  },
                ),
              ),
            ),

            const SizedBox(height: 4.0),

            // 3. Sadaqah Jariyah Banner
            const SadaqahBanner(),

            const SizedBox(height: 80.0), // Final spacing
          ],
        ),
      ),
    );
  }
}
