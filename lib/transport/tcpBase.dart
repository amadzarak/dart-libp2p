class TCPOptionsInterface {
  int? inboundSocketInactivityTimeout;
  int? outboundSocketInactivityTimeout;
  int? socketCloseTimeout;
  int? maxConnections;
  int? backlog;
  CloseServerOnMaxConnectionsOpts? closeServerOnMaxConnections;
  TCPSocketOptions? dialOpts;
  TCPSocketOptions? listenOpts;
}

class TCPSocketOptions {
  bool? noDelay;
  bool? keepAlive;
  int? keepAliveInitialDelay;
  bool? allowHalfOpen;
}

class CloseServerOnMaxConnectionsOpts {
  int listenBelow;
  int closeAbove;

  CloseServerOnMaxConnectionsOpts(this.listenBelow, this.closeAbove);
}
