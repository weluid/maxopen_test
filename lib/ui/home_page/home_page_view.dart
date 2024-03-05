import 'package:flutter/material.dart';
import 'package:maxopen_test/repository/local_storage.dart';
import 'package:maxopen_test/ui/home_page/widgets/map_widget.dart';
import 'package:maxopen_test/ui/home_page/widgets/user_card.dart';
import 'package:maxopen_test/utils/extentions.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
        const MapWidget(),
      ],
    ));
  }
}
