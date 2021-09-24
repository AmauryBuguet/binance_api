import '../common/binance_abstract.dart';

class BinanceFutures extends BinanceAbstract {
  BinanceFutures({
    String? key,
    String? secret,
  }) : super(
          key: key,
          secret: secret,
          endpoint: "fapi.binance.com",
          wsEndpoint: "wss://fstream.binance.com",
          prefix: "fapi/v1",
        );
}
