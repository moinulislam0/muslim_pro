import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_design/core/images/images.dart';
import 'package:ui_design/core/colors/colors.dart';

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
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      headingText,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: headingTextColor,
                                        decoration: isStrikethrough
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                        decorationThickness: isStrikethrough
                                            ? 2
                                            : 0,
                                        decorationColor: Color(0xFF9d8960),
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
                              const SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  bodyText,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "roboto",
                                    fontWeight: FontWeight.w400,
                                    color: bodyTextColor,
                                    decoration: isStrikethrough
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    decorationThickness: isStrikethrough
                                        ? 2
                                        : 0,
                                    decorationColor: Color(0xFF9d8960),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // To push date/time to the bottom
              const SizedBox(height: 12), // Spacing before date/time row
              // Date and Time Row
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                    left: 8,
                    right: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: .07),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.calendar,
                            height: 14,
                            width: 14,
                            color: Color(0XFF000000).withValues(alpha: 0.3),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '27 Rajab 1444 AH',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "roboto", // Smaller for grid
                              color: Color(0XFF000000).withValues(alpha: 0.3),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.clock,
                            height: 14,
                            width: 14,
                            fit: BoxFit.cover,
                            color: Color(0XFF000000).withValues(alpha: 0.3),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Open 24Hours',
                            style: TextStyle(
                              fontSize: 12, // Smaller for grid
                              color: Color(0XFF000000).withValues(alpha: 0.3),
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
        'headingTextColor': AppColors.headingTextColor, // ✅ Add this
        'bodyTextColor': AppColors.headingTextColor.withValues(alpha: .9),
        'body':
            'Typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before',
        'completed': true,
        'strikethrough': true,
        'iconBgColor': AppColors.iconBgColor,
        'iconColors': AppColors.iconColor,
        'iconborderColor': AppColors.iconborderColor,
      },
      {
        'color': AppColors.cardGreen,
        'heading': 'This is Heading',
        'headingTextColor': Color(
          0xFF000000,
        ).withValues(alpha: .6), // ✅ Add this
        'bodyTextColor': Color(0xFF000000).withValues(alpha: .6),
        'body':
            'Typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before',
        'completed': true,
        'strikethrough': false,
        'iconBgColor': Colors.white,
        'iconColors': Color(0xFFc3c6c9),
        'iconborderColor': AppColors.iconborderColor,
      },
      {
        'color': AppColors.cardPurple,
        'heading': 'This is Heading',
        'headingTextColor': Color(
          0xFF000000,
        ).withValues(alpha: .6), // ✅ Add this
        'bodyTextColor': Color(0xFF000000).withValues(alpha: .6),
        'body':
            'Typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before',
        'completed': true,
        'strikethrough': false,
        'iconBgColor': Colors.white,
        'iconColors': Color(0xFFc3c6c9),
        'iconborderColor': AppColors.iconborderColor,
      },
      {
        'color': AppColors.cardYellow,
        'heading': 'This is Heading',
        'headingTextColor': Color(
          0xFF000000,
        ).withValues(alpha: .6), // ✅ Add this
        'bodyTextColor': Color(0xFF000000).withValues(alpha: .6),
        'body':
            'Typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before',
        'completed': true,
        'strikethrough': false,
        'iconBgColor': Colors.white,
        'iconColors': Color(0xFFc3c6c9),
        'iconborderColor': AppColors.iconborderColor,
      },
      {
        'color': AppColors.cardRed,
        'heading': 'This is Heading',
        'headingTextColor': Color(
          0xFF000000,
        ).withValues(alpha: .6), // ✅ Add this
        'bodyTextColor': Color(0xFF000000).withValues(alpha: .6),
        'body':
            'Typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before',
        'completed': true,
        'strikethrough': false,
        'iconBgColor': Colors.white,
        'iconColors': Color(0xFFc3c6c9),
        'iconborderColor': AppColors.iconborderColor,
      },
      {
        'color': AppColors.cardBlue,
        'heading': 'This is Heading',
        'body':
            'Typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before',
        'completed': true,
        'strikethrough': false,
        'headingTextColor': Color(
          0xFF000000,
        ).withValues(alpha: .6), // ✅ Add this
        'bodyTextColor': Color(0xFF000000).withValues(alpha: .6),
        'iconBgColor': Colors.white,
        'iconColors': Color(0xFFc3c6c9),
        'iconborderColor': AppColors.iconborderColor,
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
                    0.88, // Adjust to control card height/width ratio
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
            bottom: 20.0,
            right: 20.0,
            child: Container(
              width: 56, // ✅ Circle এর width
              height: 56, // ✅ Circle এর height (same as width)
              decoration: BoxDecoration(
                color: AppColors.fabBackground,
                shape: BoxShape.circle, // ✅ Perfect circle
              ),
              child: InkWell(
                onTap: () {
                  // Action for adding a new task
                },
                borderRadius: BorderRadius.circular(
                  28,
                ), // ✅ Ripple effect circular
                child: const Icon(
                  Icons.add,
                  color: AppColors.fabIcon,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
