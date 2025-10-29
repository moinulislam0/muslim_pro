import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// --- Color Constants (Approximated from the final image) ---
class FinalQiblaColors {
  static const Color scaffoldBackground = Color(
    0xFFF9F9F9,
  ); // Overall screen background
  static const Color compassLineColor = Color(
    0xFFB2DFDB,
  ); // Light Teal/Mint for compass lines
  static const Color compassNeedleColor = Color(
    0xFF424242,
  ); // Dark gray for the needle
  static const Color locationBarColor = Color(
    0xFFE0F2F1,
  ); // Very light teal/mint for location pill
  static const Color instructionBoxColor = Color(
    0xFFB2DFDB,
  ); // Slightly darker teal/mint for instruction box

  static const Color infinityIconColor = Color(
    0xFF009688,
  ); // Teal/Greenish accent color
  static const Color mainTextColor = Color(0xFF424242); // Main text color
  static const Color noteTextColor = Color(0xFF616161); // Gray for NOTE text
  static const Color noteAccentColor = Color(
    0xFF8BC34A,
  ); // Light green for 'NOTE:'
}

// --- Custom Icon Placeholders ---

// Placeholder for the Kaaba icon in the location bar
class KaabaIcon extends StatelessWidget {
  const KaabaIcon({super.key});

  @override
  Widget build(BuildContext context) {
    // Using an icon that resembles a structure/building for the Kaaba
    return SvgPicture.asset(
      "assets/images/group.svg",
      fit: BoxFit.contain,
      height: 26,
      width: 26,
      // Slightly subdued color
    );
  }
}

Widget _buildCardinal(String text, double size) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: FinalQiblaColors.compassNeedleColor,
    ),
  );
}

Widget _buildQiblaMarker() {
  // Placeholder for the Kaaba symbol marker on the ring
  return Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      color: FinalQiblaColors.locationBarColor.withOpacity(0.8),
      shape: BoxShape.circle,
      border: Border.all(color: FinalQiblaColors.compassLineColor, width: 1.0),
    ),
    child: const Center(child: KaabaIcon()),
  );
}

class FinalQiblaScreen extends StatelessWidget {
  const FinalQiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFf4f4f4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow
          color: FinalQiblaColors.mainTextColor,
          onPressed: () {},
        ),
        title: Text(
          'Qibla Finder',
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w700,
            color: FinalQiblaColors.mainTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Use a SingleChildScrollView in case content overflows a small screen
        child: Column(
          children: <Widget>[
            const SizedBox(height: 38.0),

            // 1. Compass Widget
            Container(
              child: SvgPicture.asset(
                'assets/images/compas.svg',
                fit: BoxFit.cover,
                height: 360,
                width: 305,
                alignment: Alignment.center,

                // Center the compass image
              ),
            ),

            const SizedBox(height: 50.0),

            // 2. Location Bar
            _buildLocationBar(),

            const SizedBox(height: 60.0),

            // 3. Instruction Box
            _buildInstructionBox(),

            const SizedBox(height: 20.0),

            // 4. Note Text
            _buildNoteText(),

            const SizedBox(height: 90.0), // Extra space at the bottom
          ],
        ),
      ),
    );
  }

  Widget _buildLocationBar() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
        decoration: BoxDecoration(
          color: Color(0XFFe1ede9),
          borderRadius: BorderRadius.circular(
            8.0,
          ), // Slightly less pill-shaped than before
          border: Border.all(color: Colors.black.withOpacity(0.05), width: 1.0),
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            KaabaIcon(),
            const SizedBox(width: 14.0),
            Text(
              '277 Mecca, Saudi Arabia',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'roboto',
                fontWeight: FontWeight.w600,
                color: FinalQiblaColors.mainTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionBox() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ), // Margin on sides of the box
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Color(0XFFe1ede9),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: <Widget>[
          // Infinity Icon
          SvgPicture.asset(
            'assets/images/calendar.svg',
            fit: BoxFit.cover,
            height: 30,
            width: 87,
          ),
          const SizedBox(height: 16.0),
          // Instruction Text
          Text(
            'To determine Qibla, turn the phone left and right several times and keep it parallel to the ground.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'roboto',
              fontWeight: FontWeight.w600,
              color: Color(0XFF3D4953),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            const TextSpan(
              text: 'NOTE: ',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
                fontFamily: "roboto",
                color: Color(0XFF59bd99),
              ),
            ),
            const TextSpan(
              text:
                  'Qibla compass requires  magnetic and accelerometer sensors.requires Your phone will only point in the right direction if those sensors are enabled. Otherwise it won\'t work.',
              style: TextStyle(
                color: Color.fromARGB(255, 158, 159, 160),
                fontSize: 14,
                fontFamily: "roboto",
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
