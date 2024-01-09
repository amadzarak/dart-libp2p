//https://github.com/libp2p/py-libp2p/blob/master/libp2p/transport/tcp/tcp.py
import 'dart:async';
import 'package:dart_multiaddr/dart_multiaddr.dart';
import 'dart:io';

Multiaddr multiAddrFromSocket(Socket socket) {
  var ip = socket.address.address;
  var port = socket.port;
  return Multiaddr.fromString('/ip4/$ip/tcp/$port');
}
