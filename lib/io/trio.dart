import 'dart:async';
import 'dart:ffi';
import 'package:dartlibptp/io/base.dart';
import 'dart:io';

class AsyncTCPStream implements ReadWriteCloser {
  AsyncTCPStream({required this.stream});
  Socket stream;

  @override
  void write() async {
    stream.addStream(stream);
  }

  @override
  void read() async {}

  @override
  void close() async {}
}
