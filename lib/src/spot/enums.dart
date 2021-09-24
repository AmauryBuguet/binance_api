import 'package:flutter/foundation.dart';

enum SymbolStatus {
  PRE_TRADING,
  TRADING,
  POST_TRADING,
  END_OF_DAY,
  HALT,
  AUCTION_MATCH,
  BREAK,
}

extension SymbolStatusExt on SymbolStatus {
  String toStr() => describeEnum(this);
}

enum OrderStatus {
  NEW,
  PARTIALLY_FILLED,
  FILLED,
  CANCELED,
  PENDING_CANCEL,
  REJECTED,
  EXPIRED,
}

extension OrderStatusExt on OrderStatus {
  String toStr() => describeEnum(this);
}

enum OcoStatus {
  RESPONSE,
  EXEC_STARTED,
  ALL_DONE,
}

extension OcoStatusExt on OcoStatus {
  String toStr() => describeEnum(this);
}

enum OcoOrderStatus {
  EXECUTING,
  ALL_DONE,
  REJECT,
}

extension OcoOrderStatusExt on OcoOrderStatus {
  String toStr() => describeEnum(this);
}

enum OrderType {
  LIMIT,
  MARKET,
  STOP_LOSS,
  STOP_LOSS_LIMIT,
  TAKE_PROFIT,
  TAKE_PROFIT_LIMIT,
  LIMIT_MAKER,
}

extension OrderTypeExt on OrderType {
  String toStr() => describeEnum(this);
}

enum TimeInForce {
  GTC,
  IOC,
  FOK,
}

extension TimeInForceExt on TimeInForce {
  String toStr() => describeEnum(this);
}

extension EnumSpotExt on String {
  SymbolStatus toSymbolStatusEnum() =>
      SymbolStatus.values.firstWhere((s) => describeEnum(s) == this);
  OrderStatus toOrderStatusEnum() =>
      OrderStatus.values.firstWhere((s) => describeEnum(s) == this);
  OcoStatus toOcoStatusEnum() =>
      OcoStatus.values.firstWhere((s) => describeEnum(s) == this);
  OcoOrderStatus toOcoOrderStatusEnum() =>
      OcoOrderStatus.values.firstWhere((s) => describeEnum(s) == this);
  OrderType toOrderTypeEnum() =>
      OrderType.values.firstWhere((s) => describeEnum(s) == this);
  TimeInForce toTimeInForceEnum() =>
      TimeInForce.values.firstWhere((s) => describeEnum(s) == this);
}
