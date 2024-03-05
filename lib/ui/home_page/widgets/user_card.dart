import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maxopen_test/utils/extentions.dart';

class UserCard extends StatelessWidget {
  final String userName;

  const UserCard({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.darkGray,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 19,
            right: -100,
            child: ClipRRect(
              child: SvgPicture.asset("assets/images/home_page/car.svg"),
            ),
          ),
          Positioned(
            top: 11,
            right: 57,
            child: SvgPicture.asset(
              "assets/images/home_page/icon_one.svg",
            ),
          ),
          Positioned(
            top: 52,
            right: 95,
            child: SvgPicture.asset(
              "assets/images/home_page/icon_two.svg",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Привіт,',
                  style: context.textTheme.bodyMedium,
                ),
                Text(
                  userName,
                  style: context.textTheme.displayLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  "Додавання авто",
                  style: context.textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.68,
                  child: Text(
                    "Завантажте дані про ваше авто для кращого використання сервісу.",
                    style: context.textTheme.displayMedium,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Text("Додати авто"),
                       Icon(Icons.chevron_right, size: 10,)
                     ],

                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
