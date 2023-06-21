import "package:flutter/material.dart";
import "package:kuunganatask/src/features/dashboard/presentation/indicators/indicators.dart";
import "package:kuunganatask/src/styles.dart";
class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;
  final TabController tabController;
  const BottomNavigationBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onTabTapped,
    required this.tabController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:64,
      padding:const EdgeInsets.symmetric(vertical:10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 40,left:24, right:24),
      child: TabBar(
        controller: tabController,
        indicator: const DotIndicator(),
        onTap: onTabTapped,
        tabs: [
          Tab(
            icon: selectedIndex == 0 
                ? AppStyles.homeFilled
                : AppStyles.home,
          ),
          Tab(
            icon: selectedIndex == 1  
                ? AppStyles.chatFilled
                : AppStyles.chat,
          ),
          Tab(
            icon: selectedIndex == 2  
                ? AppStyles.notificationFilled
                :AppStyles.notification ,
          ),
          Tab(
            icon: selectedIndex == 3  
                ? AppStyles.settingFilled
                : AppStyles.setting,
          ),
        ],
      ),
    );
  }
}
