import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multimesh/services/ble/ble_permissions_requester.dart';
import 'package:multimesh/services/wrap/flutter_blue_plus_mockable.dart';
import 'package:multimesh/services/wrap/permissions.dart';
import 'package:platform/platform.dart';

import 'ble_permissions_requester_test.mocks.dart';

@GenerateMocks(
  [
    LocalPlatform,
    FlutterBluePlusMockable,
    Permissions,
  ],
)
void main() {
  late BlePermissionsRequester blePermissionsRequester;
  late LocalPlatform localPlatform;
  late Permissions permissions;
  late FlutterBluePlusMockable flutterBluePlus;

  setUp(() {
    localPlatform = MockLocalPlatform();
    permissions = MockPermissions();
    flutterBluePlus = MockFlutterBluePlusMockable();

    blePermissionsRequester = BlePermissionsRequester(
      localPlatform: localPlatform,
      flutterBluePlus: flutterBluePlus,
      permissions: permissions,
    );
  });

  test('call locationWhenInUseRequest', () async {
    when(localPlatform.isAndroid).thenReturn(false);

    await blePermissionsRequester.request();

    verify(permissions.locationWhenInUseRequest()).called(1);
  });

  test('android must call turnOn()', () async {
    when(localPlatform.isAndroid).thenReturn(true);

    await blePermissionsRequester.request();

    verify(flutterBluePlus.turnOn()).called(1);
  });

  test('android exception from turnOn()', () async {
    when(localPlatform.isAndroid).thenReturn(true);
    when(flutterBluePlus.turnOn()).thenThrow(Exception());

    final result = await blePermissionsRequester.request();

    expect(result, equals(false));
  });

  test('non-android must not call turnOn()', () async {
    when(localPlatform.isAndroid).thenReturn(false);

    await blePermissionsRequester.request();

    verifyNever(flutterBluePlus.turnOn());
  });

  test('success', () async {
    when(localPlatform.isAndroid).thenReturn(false);

    final result = await blePermissionsRequester.request();

    expect(result, equals(true));
  });
}
