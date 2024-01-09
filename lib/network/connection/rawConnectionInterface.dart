import 'dart:ffi';
import 'package:dart_multihash/dart_multihash.dart';

import 'package:dart_multiaddr/dart_multiaddr.dart';
import 'package:dartlibptp/io/base.dart';

enum ConnectionStatus { open, closing, closed }

enum ReadStatus { ready, closing, closed }

enum WriteStatus { ready, writing, done, closing, closed }

enum Direction { inbound, outbound }

enum PeerIdType { RSAPeerId, Ed25519PeerId, Secp256k1PeerId }

class IRawConnection extends ReadWriteCloser {
  bool isInitiator;

  IRawConnection(
      {required this.isInitiator,
      required reader,
      required writer,
      required closer})
      : super(reader: reader, writer: writer, closer: closer);
}

class ConnectionTimeline {
  DateTime open = DateTime.now();
  DateTime? close;
  DateTime? closeRead;
  DateTime? closeWrite;
  DateTime? reset;
  DateTime? abort;
}

class Connection {
  String id; //should this be uuid???
  Multiaddr remoteAddr;
  PeerId remotePeer;
  List<String> tags;
  List<Stream> streams;
  Direction direction;
  ConnectionTimeline timeline;
  String? multiplexer;
  String? encryption;
  ConnectionStatus status;
  bool transient;

  Connection(
      {required this.id,
      required this.remoteAddr,
      required this.remotePeer,
      this.tags = const [],
      this.streams = const [],
      required this.direction,
      required this.timeline,
      this.multiplexer,
      this.encryption,
      required this.status,
      required this.transient});

  //newStream(protocols: string | string[], options?: NewStreamOptions): Promise<Stream>
  Future<Stream> newStream(NewStreamOptions? options,
      {List<String>? protocols, String? protocol}) {
    throw Exception('Error inside newStream function');
  }

  Future<void> close(AbortOptions? options) {
    throw Exception('Error inside close functions');
  }

  void abort() {}
}

class AbortOptions {}

class NewStreamOptions extends AbortOptions {
  int? maxOutboundStreams;
  bool runOnTransientConnection = false;
  bool negotiateFully = true;
}

class BasePeerID {
  PeerIdType type;
  List multiHash; //MultihashInfo.digest returns a list
  List<Uint8>? privateKey;
  List<Uint8>? publicKey;

  BasePeerID(
      {required this.type,
      required this.multiHash,
      this.privateKey,
      this.publicKey});
}

class RSAPeerId extends BasePeerID {
  List<Uint8>? publicKey;

  RSAPeerId(
      {required type,
      required multiHash,
      required this.publicKey,
      required privateKey})
      : super(type: type, multiHash: multiHash, privateKey: privateKey);
}
