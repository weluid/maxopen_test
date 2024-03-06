import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_test/bloc/login_page_bloc/login_page_bloc.dart';
import 'package:maxopen_test/ui/global_widgets/common_text_field.dart';
import 'package:maxopen_test/ui/global_widgets/title_and_subtitle.dart';

import '../global_widgets/common_button.dart';

/// Login page view
/// responsible for displaying the UI
class LoginPageView extends StatefulWidget {
  final bool loadingState;
  final String? name;

  const LoginPageView({
    super.key,
    this.loadingState = false,
    this.name,
  });

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    if (widget.name != null) {
      textController.text = widget.name!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 88),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 59),
              child: TitleAndSubtitle(
                title: "Як до вас звертатися?",
                subtitle:
                    "Будь ласка, укажіть ваше ім'я для персоналізації сервісу. ",
              ),
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: CommonTextField(
                hint: 'Ваше ім’я',
                controller: textController,
                onChanged: (text) {
                  setState(() {});
                },
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(
                left: 22,
                right: 22,
                bottom: 20,
              ),
              child: CommonButton(
                title: 'Продовжити',
                onTap: textController.text.isNotEmpty
                    ? () {
                        context.read<LoginPageBloc>().add(
                              CreateUserEvent(textController.text),
                            );
                      }
                    : null,
                loadingState: widget.loadingState,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
