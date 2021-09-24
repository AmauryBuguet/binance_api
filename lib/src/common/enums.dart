import 'package:flutter/foundation.dart';

enum Side {
  BUY,
  SELL,
}

extension SideExt on Side {
  String toStr() => describeEnum(this);
}

enum Interval {
  INTERVAL_1m,
  INTERVAL_3m,
  INTERVAL_5m,
  INTERVAL_15m,
  INTERVAL_30m,
  INTERVAL_1h,
  INTERVAL_2h,
  INTERVAL_4h,
  INTERVAL_6h,
  INTERVAL_8h,
  INTERVAL_12h,
  INTERVAL_1d,
  INTERVAL_3d,
  INTERVAL_1w,
  INTERVAL_1M,
}

extension IntervalExt on Interval {
  String toStr() => describeEnum(this).split("_").last;
}

extension EnumExt on String {
  Side toSideEnum() => Side.values.firstWhere((s) => describeEnum(s) == this);
  Interval toIntervalEnum() => Interval.values
      .firstWhere((s) => describeEnum(s).split("_").last == this);
}
