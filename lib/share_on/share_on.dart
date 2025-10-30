import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
// You might need the 'url_launcher' package for actual social media sharing functionality,
// but for UI replication, we'll focus on the visual aspect.

// --- Color Constants (Extracted/Inferred from Image) ---
class AppColors {
  // Background is white (inferred from surrounding context/crops)
  static const Color background = Colors.white;
  // Text Color (Share On:) - Medium Gray
  static const Color textPrimary = Color(0xFF888888);
  // Facebook Icon Color
  static const Color facebookBlue = Color(0xFF1877F2);
  // LinkedIn Icon Color
  static const Color linkedinBlue = Color(0xFF0A66C2);
  // Twitter Icon Color
  static const Color twitterBlue = Color(0xFF1DA1F2);
}

// --- Icon Data ---
class AppIcons {
  // Share Icon (Standard Material Icon for connection/share)
  static const IconData shareIcon = Icons.share_outlined;
}

class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // We will use a container with padding to simulate the row being low on a card/page
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ), // Inferred padding around the whole row
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize:
              MainAxisSize.min, // Only take up space needed for content
          children: [
            // 1. Share Icon
            SvgPicture.asset(
              "assets/images/share.svg",
              fit: BoxFit.cover,
              height: 16,
              width: 16,
            ),
            const SizedBox(width: 8.0), // Spacing between icon and text
            // 2. Share On: Text
            Text(
              'Share On:',
              style: TextStyle(
                fontSize: 16, // Inferred size
                fontWeight: FontWeight.w400,
                fontFamily: "roboto", // Regular weight
                color: Color(0XFF6F767D),
              ),
            ),
            const SizedBox(width: 12.0), // Spacing between text and first icon
            // 3. Social Media Icons
            _buildSocialIcon(
              icon:
                  "assets/images/facebook.svg", // Using generic icon for Facebook 'f'
              onTap: () {},
            ),
            const SizedBox(width: 10.0), // Spacing between icons (inferred)

            _buildSocialIcon(
              icon:
                  "assets/images/linkedin.svg", // Using 'in' for LinkedIn approximation
              onTap: () {},
            ),
            const SizedBox(width: 10.0), // Spacing between icons (inferred)

            _buildSocialIcon(
              icon:
                  "assets/images/twitter.svg", // Using generic icon for Twitter bird
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  // Helper for Social Media Icon Button
  Widget _buildSocialIcon({required String icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.0, // Inferred circular button size
        height: 36.0, // Inferred circular button size

        child: Center(
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.cover,

            height: 28.0,
            width: 28.0,

            // Inferred icon size
          ),
        ),
      ),
    );
  }
}
