import 'package:dart_multiaddr/dart_multiaddr.dart';
import 'package:uuid/uuid.dart';
import 'package:dartlibptp/network/connection/rawConnectionInterface.dart';
import 'package:dartlibptp/transport/dialOptions.dart';

class Listener {
  bool once;
  var callback; //should this be a function???

  Listener({required this.once, this.callback});
}

class CreateListenerOptions {
  ConnectionHandler? handler;
  Upgrader? upgrader;
}

class ConnectionHandler {
  Connection connection;

  ConnectionHandler({required this.connection});
}

class Upgrader {
  //deal with upgraders later.
  Future<Connection> upgradeOutbound() {
    throw UnimplementedError();
  }
}

class MultiaddrConnection {
  Multiaddr remoteAddr;
  MultiaddrConnectionTimeline timeline;

  MultiaddrConnection({required this.remoteAddr, required this.timeline});
  Future<void> close() {
    throw UnimplementedError();
  }

  void abort() {
    throw UnimplementedError();
  }
}

class MultiaddrConnectionTimeline {
  DateTime open;

  DateTime? upgraded;
  DateTime? close;

  MultiaddrConnectionTimeline({required this.open, this.upgraded, this.close});
}

class Transport {
  Uuid transportID = Uuid();

  Future<Connection> dial(Multiaddr addr, {DialOptions? options}) {
    throw UnimplementedError();
  }

  Listener createListener(CreateListenerOptions options) {
    throw UnimplementedError();
  }
}
