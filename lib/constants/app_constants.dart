import 'package:platform/platform.dart';

const BATCH_NUM_MESSAGES_TO_LOAD = 100;
const _platform = LocalPlatform();
// ignore: non_constant_identifier_names
final CAN_UPLOAD_LOGS = !_platform.isWindows && !_platform.isLinux;
