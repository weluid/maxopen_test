import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/themes/styles.dart';

class CustomBottomBar extends StatefulWidget {
  final int activePageIndex;

  const CustomBottomBar({super.key, required this.activePageIndex});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(46),
          topLeft: Radius.circular(46),
        ),
        color: Theme.of(context).cardColor,
      ),
      child: _bottomBarRow(context: context),
    );
  }

  Widget _bottomBarRow({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(bottom: Platform.isIOS ? 16 : 0, top: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0;
          i < 3;
          i++) ...[
            _tab(
              context: context,
              text: '1111',
              imagePath: '',
              tabIndex: i,
            ),
          ],
        ],
      ),
    );
  }

  Widget _tab({
    required BuildContext context,
    required String imagePath,
    required String text,
    required int tabIndex,
  }) {
    return IconButton(
      iconSize: 54,
      splashColor: Colors.transparent,
      splashRadius: 20,
      onPressed: () {},
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              imagePath,
              colorFilter: ColorFilter.mode(
                widget.activePageIndex != tabIndex
                    ? Theme.of(context).disabledColor
                    : Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppFont.dewiRegular,
              fontSize: 10,
              color: widget.activePageIndex != tabIndex
                  ? Theme.of(context).disabledColor
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
