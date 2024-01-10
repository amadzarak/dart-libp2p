import 'package:dart_multiaddr/dart_multiaddr.dart';

abstract class listenerInterface {
  void listen();
  List<Multiaddr> getAddrs(); //record of multiaddrs
  void close();
}
