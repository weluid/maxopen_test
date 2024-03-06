import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function? onCancelTap;

  const AppAlertDialog({
    super.key,
    required this.title,
    required this.subtitle,
    this.onCancelTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(subtitle),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
            if (onCancelTap != null) {
              onCancelTap!.call();
            }
          },
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => openAppSettings(),
          child: const Text('Settings'),
        ),
      ],
    );
  }
}
