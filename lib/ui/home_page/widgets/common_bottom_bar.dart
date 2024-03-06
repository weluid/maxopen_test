import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maxopen_test/utils/extentions.dart';

/// Common bottom bar of Home page
class CommonBottomBar extends StatelessWidget {
  const CommonBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: context.colors.backgroundContent,
      selectedItemColor: Colors.white,
      unselectedItemColor: context.colors.lightGray,
      unselectedLabelStyle: context.textTheme.labelSmall,
      selectedLabelStyle: context.textTheme.labelSmall,
      currentIndex: 1,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              "assets/images/home_page/bottom_bar/clipboard.svg"),
          label: "Заявки",
        ),
        BottomNavigationBarItem(
          icon:
          SvgPicture.asset("assets/images/home_page/bottom_bar/home.svg"),
          label: "Головна",
        ),
        BottomNavigationBarItem(
          icon:
          SvgPicture.asset("assets/images/home_page/bottom_bar/user.svg"),
          label: "Особисті дані",
        ),
      ],
    );
  }
}
