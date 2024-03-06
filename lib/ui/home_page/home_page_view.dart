import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maxopen_test/repository/local_storage.dart';
import 'package:maxopen_test/ui/global_widgets/common_button.dart';
import 'package:maxopen_test/ui/home_page/widgets/map_widget.dart';
import 'package:maxopen_test/ui/home_page/widgets/user_card.dart';
import 'package:maxopen_test/utils/extentions.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomePageView extends StatefulWidget {
  final Position? position;

  const HomePageView({super.key, this.position});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late StreamSubscription subscription;
  bool internetConnection = true;

  @override
  initState() {
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          setState(() {
            internetConnection = false;
          });
        } else {
          setState(() {
            internetConnection = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.6,
                  decoration: BoxDecoration(
                    color: context.colors.backgroundPrimary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 102,
                      right: 22,
                      left: 22,
                      bottom: 20,
                    ),
                    child: UserCard(
                      userName: LocalStorage().currentUser,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: MapWidget(
                position: widget.position,
                internetConnection: internetConnection,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: CommonButton(
                title: "Викликати майстра",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: context.colors.backgroundContent,
        selectedItemColor: Colors.white,
        unselectedItemColor: context.colors.lightGray,
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
      ),
    );
  }
}
