import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Màu sắc chủ đạo lấy từ ảnh
  final Color kDarkBlue = const Color(0xFF0D255F);
  final Color kLightGreyBg = const Color(0xFFF0F4F8);

  // Trạng thái checkbox mẫu
  bool isMorningMeds = true;
  bool isAfternoonMeds = true;
  bool isBandage = true;
  bool isEveningMeds = false;
  bool isSteps = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Section
              _buildHeader(),
              const SizedBox(height: 24),

              // 2. Daily Tasks Section
              _buildSectionTitle("DAILY TASKS", icon: Icons.add),
              const SizedBox(height: 12),
              _buildDailyTasksCard(),
              
              const SizedBox(height: 24),

              // 3. Daily Meals Section
              _buildSectionTitle("DAILY MEALS", icon: Icons.chevron_right),
              const SizedBox(height: 12),
              _buildMealCard("Breakfast - Omelet"),
              const SizedBox(height: 16),
              _buildMealCard("Lunch - Salad"), // Ví dụ thêm món thứ 2
              
              const SizedBox(height: 80), // Khoảng trống cho Bottom Bar
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // --- Widgets con ---

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Hi {{name}}",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Icon(Icons.calendar_today_outlined, color: Colors.grey[700]),
      ],
    );
  }

  Widget _buildSectionTitle(String title, {required IconData icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: kDarkBlue,
            letterSpacing: 0.5,
          ),
        ),
        Icon(icon, size: 24, color: Colors.black87),
      ],
    );
  }

  Widget _buildDailyTasksCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: kLightGreyBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildTaskItem(Icons.medication_outlined, "Morning meds", "8:00", isMorningMeds, (v) => setState(() => isMorningMeds = v!)),
          _buildTaskItem(Icons.medication_outlined, "Afternoon meds", "15:00", isAfternoonMeds, (v) => setState(() => isAfternoonMeds = v!)),
          _buildTaskItem(Icons.healing_outlined, "Replace bandage", "15:00", isBandage, (v) => setState(() => isBandage = v!)),
          _buildTaskItem(Icons.medication_outlined, "Evening meds", "20:00", isEveningMeds, (v) => setState(() => isEveningMeds = v!)),
          // Item đặc biệt có icon phụ
          _buildTaskItem(Icons.directions_walk, "10000 steps", null, isSteps, (v) => setState(() => isSteps = v!), showChatIcon: true),
        ],
      ),
    );
  }

  Widget _buildTaskItem(IconData icon, String title, String? time, bool value, Function(bool?) onChanged, {bool showChatIcon = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.black87),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
          if (showChatIcon) ...[
            const SizedBox(width: 8),
            const Icon(Icons.chat_bubble_outline, size: 16, color: Colors.black54),
          ],
          const Spacer(),
          if (time != null)
            Text(
              time,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          const SizedBox(width: 8),
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealCard(String mealName) {
    return Container(
      decoration: BoxDecoration(
        color: kLightGreyBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder cho hình ảnh
          Container(
            height: 150,
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[300], // Màu xám giả lập ảnh chưa load
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Center(
              child: Icon(Icons.close, color: Colors.white, size: 50), // Icon X giả lập placeholder
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              mealName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Nút Home (Được chọn)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE2E8F0), // Màu nền xám đậm hơn chút
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.home_filled, color: kDarkBlue),
                const SizedBox(width: 8),
                Text(
                  "Home",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kDarkBlue,
                  ),
                ),
              ],
            ),
          ),
          // Nút HealthBot
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.chat_bubble_outline, color: kDarkBlue),
              const SizedBox(height: 4),
              Text("HealthBot", style: TextStyle(fontSize: 10, color: kDarkBlue)),
            ],
          ),
          // Nút Profile
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person_outline, color: kDarkBlue),
              const SizedBox(height: 4),
              Text("Profile", style: TextStyle(fontSize: 10, color: kDarkBlue)),
            ],
          ),
        ],
      ),
    );
  }
}