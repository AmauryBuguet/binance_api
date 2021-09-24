import 'package:either_dart/either.dart';

import '../binance_spot.dart';

import '../../common/utils.dart';
import '../classes.dart';

extension SpotUserdataStream on BinanceSpot {
  /// Start a new user data stream end returns listenKey.
  ///
  /// The stream will close after 60 minutes unless a keepalive is sent.
  /// If the account has an active listenKey, that listenKey will be returned and its validity will be extended for 60 minutes.
  Future<Either<String, String>> createListenKey() => sendRequest(
        path: 'api/v3/userDataStream',
        type: RequestType.POST,
        keyRequired: true,
      ).then((r) => r.isRight ? Right(r.right['listenKey']) : Left(r.left));

  /// Keepalive a user data stream to prevent a time out.
  ///
  /// User data streams will close after 60 minutes.
  /// It's recommended to send a ping about every 30 minutes.
  Future<Either<String, bool>> pingListenKey({
    required String listenKey,
  }) {
    Map<String, String> params = {'listenKey': listenKey};
    return sendRequest(
      path: 'api/v3/userDataStream',
      type: RequestType.PUT,
      keyRequired: true,
      params: params,
    ).then((r) => r.isLeft ? Left(r.left) : const Right(true));
  }

  /// Close out a user data stream.
  Future<Either<String, bool>> deleteListenKey({
    required String listenKey,
  }) {
    Map<String, String> params = {'listenKey': listenKey};
    return sendRequest(
      path: 'api/v3/userDataStream',
      type: RequestType.DELETE,
      keyRequired: true,
      params: params,
    ).then((r) => r.isLeft ? Left(r.left) : const Right(true));
  }

  /// Subscribe to userdata stream
  ///
  /// data pushed can be WsAccountUpdate / WsBalanceUpdate / WsExecutionReport / WsListOrderStatus or Map if unknown
  Stream<dynamic> userDataStream({
    required String listenKey,
  }) {
    final channel = subscribe(listenKey);
    return channel.stream.map<Map>(toMap).map<dynamic>((e) {
      if (e["e"] == "outboundAccountPosition") {
        return WsAccountUpdate.fromMap(e);
      } else if (e["e"] == "balanceUpdate") {
        return WsBalanceUpdate.fromMap(e);
      } else if (e["e"] == "executionReport") {
        return WsExecutionReport.fromMap(e);
      } else if (e["e"] == "listStatus") {
        return WsListOrderStatus.fromMap(e);
      } else {
        return e;
      }
    });
  }
}
