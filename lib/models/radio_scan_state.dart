import 'package:freezed_annotation/freezed_annotation.dart';

import 'mesh_radio.dart';

part 'radio_scan_state.freezed.dart';

@freezed
class RadioScanState with _$RadioScanState {
  const factory RadioScanState({
    @Default(false) bool scanning,
    @Default([]) List<BleMeshRadio> meshRadios,
  }) = _RadioScanState;

  const RadioScanState._();
}
