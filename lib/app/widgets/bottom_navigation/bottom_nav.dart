import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/helpers.dart';
import 'package:trainee_task/app/widgets/home/ui/home_screen.dart';
import 'package:trainee_task/app/widgets/news_list/Newslist.dart';
import 'package:trainee_task/app/widgets/side_menu/Sidemenu.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentScreen = 0;
  final List<Widget> screens = [const HomeScreen(), Newslist(), Sidemenu()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(Constants.home_icon_path),
              backgroundColor: AppColors.main,
              label: Helpers.translatingWord("homeWord")),
          BottomNavigationBarItem(
              icon: Image.asset(Constants.schdeule_icon_path),
              backgroundColor: AppColors.main,
              label: Helpers.translatingWord("schdeuleWord")),
          BottomNavigationBarItem(
              icon: Image.asset(Constants.news_icon_path),
              backgroundColor: AppColors.main,
              label: Helpers.translatingWord("newsCenterWord")),
          BottomNavigationBarItem(
              icon: Image.asset(Constants.stat_icon_path),
              backgroundColor: AppColors.main,
              label: Helpers.translatingWord("statsWord")),
          BottomNavigationBarItem(
              icon: Image.asset(Constants.more_icon_path),
              backgroundColor: AppColors.main,
              label: Helpers.translatingWord("moreButtonWord"))
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: currentScreen,
        onTap: (index) {
          setState(() {
            currentScreen = index;
          });
        },
      ),
      body: IndexedStack(
        index: currentScreen,
        children: screens,
      ),
    );
  }
}
