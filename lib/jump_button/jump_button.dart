import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_design/core/colors/colors.dart';
import 'package:ui_design/core/images/images.dart';
import 'package:ui_design/core/style/style.dart';

// --- Reusable Widget: Jump Ayah Card ---
class JumpAyahCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback? onTap;

  const JumpAyahCard({
    super.key,
    required this.iconPath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 135,
        height: 85,
        padding: const EdgeInsets.all(AppDims.cardPadding),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppDims.cardBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.cover,
                height: 26,
                width: 26,
              ),
            ),
            const SizedBox(height: AppDims.iconMarginBottom),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'roboto',
                color: AppColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JumpAyahScreen extends StatelessWidget {
  const JumpAyahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('UI Replication'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: JumpAyahCard(
          iconPath: AppImages.jumpImg,
          title: 'Jump Hadith',
          onTap: () {
            // Handle tap
          },
        ),
      ),
    );
  }
}