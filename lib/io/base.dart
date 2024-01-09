abstract class Closer {
  void close();
}

abstract class Reader {
  void read();
}

abstract class Writer {
  void write();
}

abstract class ReadCloser {
  ReadCloser({required this.reader, required this.closer});
  Reader reader;
  Closer closer;
}

abstract class WriteCloser extends Writer implements Closer {}

abstract class ReadWriter extends Reader implements Writer {}

abstract class ReadWriteCloser {
  ReadWriteCloser(
      {required this.reader, required this.writer, required this.closer});
  Reader reader;
  Writer writer;
  Closer closer;
}

abstract class MsgWriter {
  void writeMsg(String msg);
}

abstract class MsgWriteCloser extends MsgWriter implements Closer {}

abstract class Encryptor {
  void encrypt();
  void decrypt();
}

abstract class EncryptedMsgReadWriter extends ReadWriter implements Encryptor {}
