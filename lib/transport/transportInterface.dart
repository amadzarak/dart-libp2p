import 'package:dart_multiaddr/dart_multiaddr.dart';
import 'package:uuid/uuid.dart';
import 'package:dartlibptp/network/connection/rawConnectionInterface.dart';

abstract class transportInterface {
  Uuid transportSymbol = Uuid();
  //[transportSymbol]: true
  MultiaddrFilter filter;

  Future<Connection> dial(Multiaddr ma, DialOptions options);
  Listener createListener(CreateListenerOptions options);
}
