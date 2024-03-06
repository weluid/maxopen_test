import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maxopen_test/services/permission_service/permission_service.dart';
import 'package:maxopen_test/ui/global_widgets/alert_dialog.dart';
import 'package:permission_handler/permission_handler.dart';


class PermissionLocationHandler extends PermissionService {
  @override
  Future<bool> handlePermission(BuildContext context) async {
    late bool canProceed;
    await requestPermission().then((PermissionStatus permissionStatus) {
      if (permissionStatus != PermissionStatus.granted) {
        showDialog(
          context: context,
          builder: (context) => const AppAlertDialog(
            title: 'Denied',
            subtitle: 'allow',
          ),
        );
        canProceed = false;
      } else {
        canProceed = true;
      }
    });
    return canProceed;
  }

  @override
  Future<PermissionStatus> requestPermission() async {
    return await Permission.location.request();
  }
}
