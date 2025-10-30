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
    color: Color(0xFF9da3a8),
    fontWeight: FontWeight.w600,
    fontFamily: 'roboto',
  );

  static const TextStyle _dateStyle = TextStyle(
    fontSize: 16.0, // Approximately 16-18px
    color: Color(0xFF3d4953),
    fontWeight: FontWeight.w500,
    fontFamily: 'poppins',
  );

  static const TextStyle _selectedDayAbbreviationStyle = TextStyle(
    fontSize: 14.0, // Approximately 12-14px
    color: Color(0xFF3d4953),
    fontWeight: FontWeight.w600,
    fontFamily: 'poppins',
  );

  static const TextStyle _selectedDateTextStyle = TextStyle(
    fontSize: 16.0, // Approximately 16-18px
    color: Color(0xFF3d4953),
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
        height: 100, // Give it a fixed height
        width: 50, // Give it a fixed width
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSelected)
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 11.0,
                  horizontal: 13.0,
                ), // 6px vertical, 8px horizontal
                decoration: BoxDecoration(
                  color: Color(0xFFf5fbf9), // rgba(52, 199, 89, 0.1)
                  border: Border.all(
                    color: Color(0xFF36b084),
                    width: 1.9,
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
            color: Color(0xFF3d4953),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Color(0XFFf4f4f4), height: 2.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "2023",
                    style: _monthTextStyle.copyWith(
                      fontFamily: "poppins",
                      color: Color(0xFF37424b),
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
                          color: Color(0xFF36b084),
                          fontSize: 15,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "English",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF3d4953),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            // 1. Month Navigation Header
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "February",
                    style: _monthTextStyle.copyWith(
                      fontWeight: FontWeight.w600, // Semi-bold
                      color: Color(0xFF36b084),
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
                      color: Color(0xFFC8CCCF),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: "poppins",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    "April",
                    style: _monthTextStyle.copyWith(
                      color: Color(0xFFC8CCCF),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: "poppins",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    "May",
                    style: _monthTextStyle.copyWith(
                      color: Color(0xFFC8CCCF),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: "poppins",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    "June",
                    style: _monthTextStyle.copyWith(
                      color: Color(0xFFC8CCCF),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: "poppins",
                    ),
                  ),
                ],
              ),
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
              height: MediaQuery.of(context).size.height - 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0XFFf4f4f4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),

              // --- PORIBORTON EKHANE ---
              // Padding-tike baire-er Container-e ana hoyeche, jate bhitorer shada card-er charpashe halka grey jaiga dekha jay.
              // padding: const EdgeInsets.fromLTRB(
              //   16.0,
              //   16.0,
              //   16.0,
              //   0,
              // ), // Niche padding 0 rakha holo
              // --- PORIBORTON SHESH ---
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 90,
                  top: 26,
                ),
                child: Container(
                  // Bhitorer Container theke padding shoriye fela hoyeche
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 26,
                  ), // Padding ekhon shada card er vitorer content er jonno
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0), // Golakar corner
                  ),
                  child: Column(
                    children: [
                      // 1. Header Section (Arrow, Title, Arrow)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Bam pasher Back Arrow
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFFf2f9f7),
                            ),
                            child: Center(
                              child: Icon(
                                Icons
                                    .arrow_back_ios_new, // Notun icon better look er jonno
                                size: 16,
                                color: Color(0XFF36b084),
                              ),
                            ),
                          ),

                          // Majhkhane Title
                          Text(
                            "My Todays Prayer",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),

                          // Dan pasher Forward Arrow
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFFf2f9f7),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color(0XFF36b084),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24.0),
                      Divider(color: Color(0XFFf4f4f4), height: 1),

                      const SizedBox(
                        height: 10.0,
                      ), // Header ebong list er majhe faka jaiga
                      // 2. Prayer List Section
                      _buildPrayerRow("Fazr", isCompleted: true),
                      _buildPrayerRow("Dhuhr"),
                      _buildPrayerRow("Asr"),
                      _buildPrayerRow("Magrib"),
                      _buildPrayerRow("Isha's"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPrayerRow(String prayerName, {bool isCompleted = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          prayerName,
          style: TextStyle(
            fontSize: isCompleted ? 18 : 16,
            fontWeight: isCompleted ? FontWeight.w700 : FontWeight.w500,
            color: isCompleted ? Color(0XFF3d4953) : Color(0XFF3d4953),
            fontFamily: 'roboto',
          ),
        ),
        Container(
          height: 25,
          width: 25,

          decoration: BoxDecoration(
            border: isCompleted
                ? null
                : Border.all(color: Color(0XFFdadddf), width: 1.5),
            borderRadius: BorderRadius.circular(50),
            color: isCompleted ? Color(0XFF36b084) : Colors.white,
          ),
          child: Icon(
            Icons.check,
            size: 20,
            color: isCompleted ? Colors.white : Color(0XFFdadddf),
          ),
        ),
      ],
    ),
  );
}
