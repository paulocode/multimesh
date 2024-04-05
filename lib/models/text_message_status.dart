enum TextMessageStatus {
  SENDING,
  RADIO_ERROR,
  @Deprecated('')
  MAX_RETRANSMIT,
  OK,
  RECVD_BY_RADIO,
  IMPLICIT_ACK, // TODO
}
