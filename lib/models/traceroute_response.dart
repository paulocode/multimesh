import 'package:freezed_annotation/freezed_annotation.dart';
part 'traceroute_response.freezed.dart';

@freezed
abstract class TracerouteResponse with _$TracerouteResponse {
  const factory TracerouteResponse({
    List<int>? route,
    DateTime? successTime,
    required DateTime attemptTime,
  }) = _TracerouteResponse;

  const TracerouteResponse._();
}
