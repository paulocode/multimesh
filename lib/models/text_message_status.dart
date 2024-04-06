enum TextMessageStatus {
  SENDING,
  RADIO_ERROR,
  // do not delete since it
  // deleting will change
  // existing DB mapping
  @Deprecated('Use RADIO_ERROR instead')
  MAX_RETRANSMIT,
  OK,
  RECVD_BY_RADIO,
  IMPLICIT_ACK, // TODO
}
