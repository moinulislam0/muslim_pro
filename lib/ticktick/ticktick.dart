import 'package:flutter/material.dart';

// --- Color Constants (Approximated/Placeholder) ---
// These colors are visually matched to the new image.
class AppColors {
  // Approximated colors based on the new image
  static const Color cardOrange = Color(0xFFFFD54F); // Warmer yellow/orange
  static const Color cardGreen = Color(0xFF81C784); // Lighter, softer green
  static const Color cardPurple = Color(0xFFBA68C8); // Softer purple
  static const Color cardYellow = Color(0xFFFFEB85); // Very light yellow
  static const Color cardRed = Color(0xFFEF9A9A); // Soft red/pink
  static const Color cardBlue = Color(0xFF90CAF9); // Soft blue

  // Background and Text Colors (Approximated)
  static const Color scaffoldBackground = Color(
    0xFFF0F2F5,
  ); // Very light grey/off-white background
  static const Color headingText = Colors.black87;
  static const Color bodyText = Colors.black54;
  static const Color iconColor = Colors.black54;
  static const Color checkmarkColor =
      Colors.white; // Color of the checkmark icon inside the circle
  static const Color fabBackground =
      Colors.white; // Background of the '+' button
  static const Color fabIcon =
      Colors.green; // Color of the '+' icon (approximated)
}

// --- Widget Components ---

class TaskCardGrid extends StatelessWidget {
  final Color cardColor,
      headingTextColor,
      bodyTextColor,
      iconBgColor,
      iconColors,
      iconborderColor;
  final String headingText;
  final String bodyText;
  final bool isCompleted;
  final bool isStrikethrough; // New property for the first card

  const TaskCardGrid({
    super.key,
    required this.cardColor,
    required this.headingTextColor,
    required this.bodyTextColor,
    required this.headingText,
    required this.bodyText,
    required this.isCompleted,
    required this.isStrikethrough,
    required this.iconBgColor,
    required this.iconColors,
    required this.iconborderColor,
  });

  @override
  Widget build(BuildContext context) {
    // The card background color is the main color provided
    final Color cardBg = cardColor;

    return Padding(
      // Adjusting horizontal padding to create the grid gap
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),

            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ), // Approximated border radius
          // Adding subtle shadow to mimic separation
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8,
            bottom: 12,
          ), // Approximated inner padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      headingText,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: headingTextColor,

                                        decoration: isStrikethrough
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                        decorationThickness: isStrikethrough
                                            ? 1.5
                                            : 0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                      color: iconBgColor,

                                      // Checkmark circle background
                                      border: Border.all(
                                        color: iconborderColor,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: isCompleted
                                        ? Icon(
                                            Icons.check,
                                            color: iconColors,
                                            size: 18,
                                          )
                                        : null,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                bodyText,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: bodyTextColor,
                                  decoration: isStrikethrough
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  decorationThickness: isStrikethrough
                                      ? 1.5
                                      : 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(), // To push date/time to the bottom
                    const SizedBox(height: 12), // Spacing before date/time row
                    // Date and Time Row
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: .12),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 16,
                                  color: AppColors.iconColor,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '27 Rajab 1444 AH',
                                  style: TextStyle(
                                    fontSize: 11, // Smaller for grid
                                    color: AppColors.iconColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 16,
                                  color: AppColors.iconColor,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Open 24Hours',
                                  style: TextStyle(
                                    fontSize: 11, // Smaller for grid
                                    color: AppColors.iconColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TasksGridScreen extends StatelessWidget {
  const TasksGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data matching the structure and order of the new image
    final List<Map<String, dynamic>> taskData = [
      {
        'color': AppColors.cardOrange,
        'heading': 'This is Heading',
         'headingTextColor': Color(0xFF3d4953), // ✅ Add this
        'bodyTextColor': Color(0xFF3d4953).withValues(alpha: .9),
        'body':
            'Typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before',
        'completed': true,
        'strikethrough': true,
        'iconBgColor': Color(0XFF77c852),
        'iconColors': Colors.white,
        'iconborderColor': Colors.white,
      },
      {
        'color': AppColors.cardGreen,
        'heading': 'This is Heading',
        'headingTextColor': Color(0xFF3d4953), // ✅ Add this
        'bodyTextColor': Color(0xFF3d4953).withValues(alpha: .9),
        'body':
            'Typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before',
        'completed': true,
        'strikethrough': false,
        'iconBgColor': Colors.white,
        'iconColors': Color(0xFFc3c6c9),
        'iconborderColor': Colors.white,
      },
      {
        'color': AppColors.cardPurple,
        'heading': 'This is Heading',
        'headingTextColor': Color(0xFF000000), // ✅ Add this
        'bodyTextColor': Color(0xFF000000),
        'body':
            'Typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before',
        'completed': true,
        'strikethrough': false,
        'iconBgColor': Colors.white,
        'iconColors': Color(0xFFc3c6c9),
        'iconborderColor': Colors.white,
      },
      {
        'color': AppColors.cardYellow,
        'heading': 'This is Heading',
        'headingTextColor': Color(0xFF000000), // ✅ Add this
        'bodyTextColor': Color(0xFF000000),
        'body':
            'Typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before',
        'completed': true,
        'strikethrough': false,
        'iconBgColor': Colors.white,
        'iconColors': Color(0xFFc3c6c9),
        'iconborderColor': Colors.white,
      },
      {
        'color': AppColors.cardRed,
        'heading': 'This is Heading',
        'headingTextColor': Color(0xFF000000), // ✅ Add this
        'bodyTextColor': Color(0xFF000000),
        'body':
            'Typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before',
        'completed': true,
        'strikethrough': false,
        'iconBgColor': Colors.white,
        'iconColors': Color(0xFFc3c6c9),
        'iconborderColor': Colors.white,
      },
      {
        'color': AppColors.cardBlue,
        'heading': 'This is Heading',
        'body':
            'Typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before',
        'completed': true,
        'strikethrough': false,
        'headingTextColor': Color(0xFF000000), // ✅ Add this
        'bodyTextColor': Color(0xFF000000),
        'iconBgColor': Colors.white,
        'iconColors': Color(0xFFc3c6c9),
        'iconborderColor': Colors.white,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0, // Slight elevation visible in the first image
        title: const Text(
          'Your Tasks:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.headingText,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'View',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54, // Approximation for 'View' text color
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.menu,
            ), // Replicating the 3-line menu icon (Hamburger)
            color: AppColors.iconColor,
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 8), // Spacing after the menu icon
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              8.0,
            ), // Padding around the whole grid area
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                childAspectRatio:
                    0.9, // Adjust to control card height/width ratio
                crossAxisSpacing: 0, // Handled by card padding
                mainAxisSpacing: 0, // Handled by card padding
              ),
              itemCount: taskData.length,
              itemBuilder: (context, index) {
                final data = taskData[index];
                return TaskCardGrid(
                  cardColor: data['color'],
                  headingText: data['heading'],
                  bodyText: data['body'],
                  isCompleted: data['completed'],
                  isStrikethrough: data['strikethrough'],
                  headingTextColor: data['headingTextColor'], // ✅ Get from data
                  bodyTextColor: data['bodyTextColor'],
                  iconBgColor: data['iconBgColor'],
                  iconColors: data['iconColors'],
                  iconborderColor: data['iconborderColor'],
                  // ✅ Get from data
                );
              },
            ),
          ),
          // Floating Action Button (FAB) positioned relative to the grid
          Positioned(
            bottom: 20.0, // Approximated distance from bottom
            right: 20.0, // Approximated distance from right
            child: FloatingActionButton(
              onPressed: () {
                // Action for adding a new task
              },
              backgroundColor: AppColors.fabBackground, // White background
              elevation: 6.0,
              child: const Icon(
                Icons.add,
                color: AppColors.fabIcon, // Greenish plus icon
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
