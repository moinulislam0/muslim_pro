import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

// --- Color Constants (Approximated from Image) ---
class AppColors {
  // AppBar Background: Darker muted color
  static const Color appBarBackground = Color(0xFF4A4B55);
  // AppBar Text/Icon: White or near-white
  static const Color appBarText = Colors.white;
  // Main Screen Background: Light grey/off-white
  static const Color screenBackground = Color(0xFFF0F0F5);
  // Main Content Card Background: Pure White
  static const Color cardBackground = Colors.white;
  // Title Text (Mosque Locations): Dark grey/black
  static const Color titleText = Color(0xFF333333);
  // Mosque Name Text: Darker black/purple-ish
  static const Color mosqueNameText = Color(0xFF3D2B4C);
  // Location/Distance Icon Color: Muted grey/black
  static const Color infoIcon = Color(0XFF49545e); // Color(0xFF888888);
  // Location/Distance Text Color: Slightly lighter than info icon
  static const Color infoText = Color.fromARGB(255, 51, 61, 70);
  // Open 24Hours Text/Icon Color: Green
  static const Color openStatus = Color.fromARGB(255, 72, 173, 136);
  // Close Now Text/Icon Color: Red
  static const Color closeStatus = Color(0xFFf63326);
  // Divider Color: Very light grey
  static const Color dividerColor = Color(0xFFF4F4F4);
  // Button Background: A color that fits the theme
  static const Color buttonBackground = Color(0xFF6200EE);
}

// --- Data Model (For structure) ---
class Mosque {
  final String name;
  final String location;
  final String distance;
  final String status;
  final bool isClosed;

  Mosque({
    required this.name,
    required this.location,
    required this.distance,
    required this.status,
    this.isClosed = false,
  });
}

// --- Reusable Widgets ---

/// Custom widget for the icon and text pair (Location, Distance, Status)
class InfoRowWidget extends StatelessWidget {
  final String icon;
  final String text;
  final Color iconColor;
  final Color textColor;

  const InfoRowWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(icon, height: 18.0, width: 20, color: iconColor),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'roboto',
                fontSize: 15.0, // Approximation
                color: textColor,
                fontWeight: FontWeight.w400, // Approximation
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget representing a single Mosque list item
class MosqueListItem extends StatelessWidget {
  final Mosque mosque;

  const MosqueListItem({Key? key, required this.mosque}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine status colors
    final statusIcon = mosque.isClosed
        ? Icons.access_time_outlined
        : Icons.access_time;
    final statusColor = mosque.isClosed
        ? AppColors.closeStatus
        : AppColors.openStatus;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Mosque Name (Title)
          Text(
            mosque.name,
            style: TextStyle(
              fontSize: 17.0, // Approximation
              color: Color(0XFF3d4953),
              fontWeight: FontWeight.w600, // Approximation
            ),
          ),
          const SizedBox(height: 10.0),

          // 2. Location Info
          InfoRowWidget(
            icon: 'assets/images/location.svg',
            text: mosque.location,
            iconColor: AppColors.infoIcon,
            textColor: AppColors.infoText,
          ),
          const SizedBox(height: 6.0),
          // 3. Distance Info
          InfoRowWidget(
            icon: "assets/images/distance.svg",
            text: mosque.distance,
            iconColor: AppColors.infoIcon,
            textColor: AppColors.infoText,
          ),
          const SizedBox(height: 6.0),
          // 4. Status Info
          InfoRowWidget(
            icon: "assets/images/timer_mos.svg",
            text: mosque.status,
            iconColor: statusColor,
            textColor: statusColor,
          ),
        ],
      ),
    );
  }
}

/// Widget for the mosque locations bottom sheet content
class MosqueLocationsBottomSheet extends StatelessWidget {
  const MosqueLocationsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample Data based on the image
    final List<Mosque> mosques = [
      Mosque(
        name: 'Baytul Falah Jame Mosque ( বায়তুল ফালাহ্ জামে মসজিদ )',
        location: 'QC2V+HM4, Dhaka',
        distance: '100 m',
        status: 'Open 24Hours',
      ),
      Mosque(
        name: 'Ahmadiyya Mosque, Madartek',
        location: 'PCXV+MVX, Unnamed Road, Dhaka',
        distance: '250 m',
        status: 'Open 24Hours',
      ),
      Mosque(
        name: 'Baytul Jannat Jame Mosque',
        location: 'PCXR+XW8, Road, Dhaka',
        distance: '450 m',
        status: 'Open 24Hours',
      ),
      Mosque(
        name: 'Goran Haji Mosque',
        location: 'Hazi Mosque, Goran, 425 Chapra Masjid Rd, Dhaka 1219',
        distance: '1 Km',
        status: 'Close Now',
        isClosed: true,
      ),
      Mosque(
        name: 'West Nandi para Al Aqsa Mosque',
        location:
            'Banasree Central Mosque, Dhaka 1212, Banasree Central Mosque, Dhaka 1212',
        distance: '1 Km', // No distance visible for the last one
        status: 'Close Now',
        isClosed: true,
      ),
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.91,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Handle/Indicator (Small grey bar at the top center)
            Center(
              child: Container(
                width: 60.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: AppColors.dividerColor,
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),

            // 2. "Mosque Locations" Title
            Center(
              child: Text(
                'Mosque Locations',
                style: TextStyle(
                  fontSize: 20.0, // Approximation
                  fontFamily: 'poppins',
                  color: AppColors.titleText,
                  fontWeight: FontWeight.w600, // Approximation
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // 3. List View of Mosques
            Expanded(
              child: ListView.separated(
                itemCount: mosques.length,
                itemBuilder: (context, index) {
                  return MosqueListItem(mosque: mosques[index]);
                },
                separatorBuilder: (context, index) {
                  // Divider present between list items except after the last one
                  if (index < mosques.length - 1) {
                    return Divider(
                      color: Color.fromARGB(255, 233, 233, 233),
                      height: .2,
                      // Add small vertical padding around the divider to match visual spacing
                      thickness: 1.0,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget for the custom AppBar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.appBarBackground,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Colors.white,
      elevation: 0, // No shadow below the app bar
      automaticallyImplyLeading: false,
      title: Center(
        child: Text(
          'Mosque Finder',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0, // Approximation
            fontWeight: FontWeight.w600, // Approximation
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          // Action for back button
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.location_searching, color: Colors.black),
          onPressed: () {
            // Action for compass/location icon
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// --- Main Screen Widget ---

class MosqueFinderScreen extends StatefulWidget {
  const MosqueFinderScreen({Key? key}) : super(key: key);

  @override
  State<MosqueFinderScreen> createState() => _MosqueFinderScreenState();
}

class _MosqueFinderScreenState extends State<MosqueFinderScreen> {
  // Function to show mosque locations in bottom sheet
  void _showMosqueLocations() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return const MosqueLocationsBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: const CustomAppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: _showMosqueLocations,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonBackground,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Show Mosque Locations',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
