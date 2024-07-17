import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduationproject/ui/home/home_tab.dart';
import 'package:graduationproject/ui/inbox/inbox_tab.dart';
import 'package:graduationproject/ui/profile/profile_tab.dart';
import 'package:graduationproject/ui/search/search_tab.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: MyTheme.primaryColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              _buildBottomNavigationBarItem('assets/images/home.png', 'Home', 0),
              _buildBottomNavigationBarItem('assets/images/search.png', 'Search', 1),
              _buildBottomNavigationBarItem('assets/images/inbox.png', 'Inbox', 2),
              _buildBottomNavigationBarItem('assets/images/profile.png', 'Profile', 3),
            ],
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _getSelectedTab(),
      ),
    );
  }

  Widget _getSelectedTab() {
    switch (selectedIndex) {
      case 0:
        return HomeTab();
      case 1:
        return SearchTab();
      case 2:
        return InboxTab();
      case 3:
        return ProfileTab();
      default:
        return HomeTab();
    }
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(String iconPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        foregroundColor: selectedIndex == index ? MyTheme.primaryColor : MyTheme.whiteColor,
        backgroundColor: selectedIndex == index ? MyTheme.whiteColor : Colors.transparent,
        child: ImageIcon(AssetImage(iconPath)),
      ),
      label: label,
    );
  }
}
