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
  // Using a placeholder icon or string to represent the custom illustration
  final IconData icon;
  final Color iconColor;

  HajjUmrahCategory({
    required this.title,
    required this.icon,
    required this.iconColor,
  });
}

// --- Dummy Data ---
final List<HajjUmrahCategory> categories = [
  HajjUmrahCategory(
    title: 'Kitabul Hajj',
    icon: Icons.account_balance,
    iconColor: const Color(0xFF795548),
  ), // Brown-ish for Kaaba
  HajjUmrahCategory(
    title: 'Illustrated Hajj',
    icon: Icons.person,
    iconColor: const Color(0xFF9E9E9E),
  ), // Gray for Ihram person
  HajjUmrahCategory(
    title: 'Umrah',
    icon: Icons.account_balance_outlined,
    iconColor: const Color(0xFF795548),
  ), // Brown-ish for Kaaba
  HajjUmrahCategory(
    title: 'Illustrated Umrah',
    icon: Icons.book_online,
    iconColor: const Color(0xFF795548),
  ), // Brown-ish for Kaaba
  HajjUmrahCategory(
    title: 'Dua',
    icon: Icons.add,
    iconColor: const Color(0xFF9E9E9E),
  ), // Gray for hands
  HajjUmrahCategory(
    title: 'Hadith',
    icon: Icons.book,
    iconColor: const Color(0xFF4CAF50),
  ), // Green for book
  HajjUmrahCategory(
    title: 'Masail',
    icon: Icons.chat_bubble,
    iconColor: const Color(0xFFFFC107),
  ), // Yellow for chat
  HajjUmrahCategory(
    title: 'Qitab',
    icon: Icons.library_books,
    iconColor: const Color(0xFF9C27B0),
  ), // Purple for stacked books
  HajjUmrahCategory(
    title: 'Hajj Videos',
    icon: Icons.play_arrow,
    iconColor: const Color(0xFFFF9800),
  ), // Orange for play button
];

// --- Reusable Widgets ---

/// Widget for the Top App Bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.appBarBackground,
      elevation: 0,
      title: const Text(
        'Hajj & Umrah',
        style: TextStyle(
          color: AppColors.appBarText,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
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
          child: Image.asset("assets/images/banner_1.png", fit: BoxFit.cover),
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
          Container(
            width: 50.0, // Estimated icon container size
            height: 50.0,

            child: SvgPicture.asset(""),
          ),
          const SizedBox(height: 8.0),
          // Label Text
          Text(
            category.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.iconLabelText,
              fontSize: 12.0, // Small font size
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
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.sadaqahBannerBg,
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
                    color: AppColors.iconLabelText,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  'SADAQAH JARIYAH',
                  style: TextStyle(
                    color: AppColors.sadaqahButtonBg,
                    fontSize: 22.0, // Large, bold text
                    fontWeight: FontWeight.w900, // Extra bold
                  ),
                ),
                const SizedBox(height: 10.0),
                // Button
                ElevatedButton(
                  onPressed: () {
                    // Handle support action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.sadaqahButtonBg,
                    foregroundColor: AppColors.sadaqahButtonText,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'I Want To Support',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4.0),
                      Icon(Icons.arrow_forward, size: 16.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Illustration Placeholder (Mosque/Palm Tree)
          // In a real app, this would be an Image.asset widget.
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.sadaqahButtonBg.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.mosque,
                size: 40,
                color: AppColors.sadaqahButtonBg,
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
            SizedBox(height: 15),
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
                        1.2, // Item-ke choto kore gap komano'r jonno.
                    // --- PORIBORTON SHESH ---
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryItem(category: categories[index]);
                  },
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            // 3. Sadaqah Jariyah Banner
            const SadaqahBanner(),

            const SizedBox(height: 20.0), // Final spacing
          ],
        ),
      ),
    );
  }
}
