import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maxopen_test/ui/home_page/home_page.dart';
import 'package:maxopen_test/ui/login_page/login_page.dart';

import '../global_widgets/common_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: 1,
        children: [
          LoginPage(),
          HomePage(),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(activePageIndex: 1),
    );
  }

}
