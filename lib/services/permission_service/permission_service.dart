import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class PermissionService {
  Future<PermissionStatus> requestPermission();

  Future<void> handlePermission(BuildContext context);

}