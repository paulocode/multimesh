enum TelemetryIntervals {
  t15m,
  t30m,
  t1h,
  t2h,
  t3h,
  t6h,
  t12h,
  t18h,
  t24h,
  t36h,
  t48h,
  t72h,
}

extension IntervalNames on TelemetryIntervals {
  String get displayName {
    return name
        .replaceAll('t', '')
        .replaceAll('m', ' minutes')
        .replaceAll('h', ' hours');
  }

  int get seconds {
    if (name.contains('m')) {
      final minutes = name.replaceAll('t', '').replaceAll('m', '');
      return int.parse(minutes) * 60;
    } else if (name.contains('h')) {
      final minutes = name.replaceAll('t', '').replaceAll('h', '');
      return int.parse(minutes) * 60 * 60;
    } else {
      return 15 * 60;
    }
  }
}
