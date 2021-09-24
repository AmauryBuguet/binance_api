import '../common/binance_abstract.dart';

class BinanceSpot extends BinanceAbstract {
  BinanceSpot({
    String? key,
    String? secret,
  }) : super(
          key: key,
          secret: secret,
          endpoint: "api.binance.com",
          wsEndpoint: "wss://stream.binance.com:9443",
          prefix: "api/v3",
        );
}
