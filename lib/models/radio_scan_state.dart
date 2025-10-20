import 'package:freezed_annotation/freezed_annotation.dart';

import 'mesh_radio.dart';

part 'radio_scan_state.freezed.dart';

@freezed
abstract class RadioScanState with _$RadioScanState {
  const factory RadioScanState({
    @Default(false) bool scanning,
    @Default([]) List<MeshRadio> meshRadios,
  }) = _RadioScanState;

  const RadioScanState._();
}
