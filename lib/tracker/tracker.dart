import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  // --- Color Constants ---
  static const Color primaryGreen = Color(0xFF34C759); // Vibrant Green
  static const Color lightGrey = Color(
    0xFFcacaca,
  ); // Light Grey for inactive elements
  static const Color darkText = Color(
    0xFF333333,
  ); // Darker grey for readability in selected state
  static const Color lightGreenBackground = Color(
    0x1A34C759,
  ); // Transparent green for highlight background

  // --- Text Styles ---
  static const TextStyle _monthTextStyle = TextStyle(
    fontSize: 19.0, // Approximately 18-20px
    fontFamily: 'SF Pro Display',
  );

  static const TextStyle _dayAbbreviationStyle = TextStyle(
    fontSize: 14.0, // Approximately 12-14px
    color: Color(0XFF9da3a8),
    fontWeight: FontWeight.w600,

    fontFamily: 'roboto',
  );

  static const TextStyle _dateStyle = TextStyle(
    fontSize: 16.0, // Approximately 16-18px
    color: Color(0XFF3d4953),
    fontWeight: FontWeight.w500,
    fontFamily: 'poppins',
  );

  static const TextStyle _selectedDayAbbreviationStyle = TextStyle(
    fontSize: 14.0, // Approximately 12-14px
    color: Color(0XFF3d4953),
    fontWeight: FontWeight.w600,
    fontFamily: 'poppins',
  );

  static const TextStyle _selectedDateTextStyle = TextStyle(
    fontSize: 16.0, // Approximately 16-18px
    color: Color(0XFF3d4953),
    fontWeight: FontWeight.w500,
    fontFamily: 'poppins',
  );

  // Helper widget to build a single day/date column
  Widget _buildDayDateColumn(
    String day,
    String date, {
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: () {
        // Add your tap handling logic here if needed
      },
      child: Container(
        height: 80, // Give it a fixed height
        width: 50, // Give it a fixed width
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSelected)
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 11.0,
                  horizontal: 12.0,
                ), // 6px vertical, 8px horizontal
                decoration: BoxDecoration(
                  color: Color(0XFFf5fbf9), // rgba(52, 199, 89, 0.1)
                  border: Border.all(
                    color: Color(0XFF36b084),
                    width: 1.8,
                  ), // 1px solid Vibrant Green
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ), // Approximately 6px border-radius
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(day, style: _selectedDayAbbreviationStyle),
                    const SizedBox(
                      height: 20.0,
                    ), // Small vertical spacing between day and date
                    Text(date, style: _selectedDateTextStyle),
                  ],
                ),
              )
            else
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(day, style: _dayAbbreviationStyle),
                  const SizedBox(
                    height: 20.0,
                  ), // Small vertical spacing between day and date
                  Text(date, style: _dateStyle),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Overall light background
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          "Tracker",
          style: TextStyle(
            fontSize: 22.0, // Approximately 18-20px
            fontWeight: FontWeight.w700, // Semi-bold
            fontFamily: 'poppins',
            color: Color(0XFF3d4953),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        bottom: PreferredSize(
          // Step 1: Nirdishto height deyar jonno PreferredSize widget
          preferredSize: const Size.fromHeight(.1), // Line-er height hobe 1.0
          // Step 2: Line toiri korar jonno ekta Container
          child: Container(
            color: Color(0XFFf4f4f4), // Line-er color
            height: 1.8, // Line-er height
          ),
        ), // No shadow
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40.0,
        ), // Overall padding for the widget
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    "2023",
                    style: _monthTextStyle.copyWith(
                      fontFamily: "poppins",
                      color: Color.fromARGB(255, 55, 66, 75),
                      fontSize: 36,
                      fontWeight: FontWeight.w600, // Semi-bold
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Change Calendar",
                        style: TextStyle(
                          color: Color(0XFF36b084),
                          fontSize: 15,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "English",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFF3d4953),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              // 1. Month Navigation Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "February",
                    style: _monthTextStyle.copyWith(
                      fontWeight: FontWeight.w600, // Semi-bold
                      color: Color(0XFF36b084),
                      fontFamily: "poppins",
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ), // Consistent horizontal spacing between month names
                  Text(
                    "March",
                    style: _monthTextStyle.copyWith(
                      color: Color.fromARGB(255, 200, 204, 207),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,

                      fontFamily: "poppins",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    "April",
                    style: _monthTextStyle.copyWith(
                      color: Color.fromARGB(255, 200, 204, 207),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,

                      fontFamily: "poppins",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    "May",
                    style: _monthTextStyle.copyWith(
                      color: Color.fromARGB(255, 200, 204, 207),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,

                      fontFamily: "poppins",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    "June",
                    style: _monthTextStyle.copyWith(
                      color: Color.fromARGB(255, 200, 204, 207),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,

                      fontFamily: "poppins",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ), // Spacing between month header and date grid
              // 2. Date Grid
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, // Distribute columns evenly
                children: [
                  _buildDayDateColumn("S", "14"),
                  _buildDayDateColumn("M", "15"),
                  _buildDayDateColumn(
                    "T",
                    "16",
                    isSelected: true,
                  ), // Selected date
                  _buildDayDateColumn("W", "17"),
                  _buildDayDateColumn("T", "18"),
                  _buildDayDateColumn("F", "19"),
                  _buildDayDateColumn("S", "20"),
                ],
              ),
              const SizedBox(height: 16.0),
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0XFFf4f4f4),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  height: 200, // Give it a fixed height
                  width: 300,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Text(
                          "Today's Tasks",
                          style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0XFF3d4953),
                          ),
                        ),
                        Text("0/5", style: TextStyle()),
                      ],
                    ),
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
