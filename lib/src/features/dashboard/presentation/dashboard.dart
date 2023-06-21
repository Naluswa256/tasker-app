import "package:flutter/material.dart";
import "package:kuunganatask/src/features/dashboard/presentation/home_page.dart";
import "package:kuunganatask/src/features/dashboard/presentation/chat_page.dart";
import "package:kuunganatask/src/features/dashboard/presentation/notification_page.dart";
import "package:kuunganatask/src/features/dashboard/presentation/setting_page.dart";
// import "package:flutter_riverpod/flutter_riverpod.dart";
// import "package:kuunganatask/src/features/authentication/data/firebaseAuth_controller.dart";
import "package:kuunganatask/src/features/dashboard/presentation/widgets/navbar.dart";
import "package:kuunganatask/src/styles.dart";
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  final _pages = [
    const HomeScreen(),
    const ChatPage(),
    const NotificationPage(),
    const SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppStyles.whiteColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onTabTapped: _onTabTapped,
        tabController: _tabController,
      ),
    );
  }
}
