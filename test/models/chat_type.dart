import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/models/chat_type.dart';

void main() {
  test('DirectMessageChat equals', () async {
    const d1 = DirectMessageChat(dmNode: 1);
    const d2 = DirectMessageChat(dmNode: 1);

    expect(d1 == d2, isTrue);
  });

  test('DirectMessageChat not equals', () async {
    const d1 = DirectMessageChat(dmNode: 1);
    const d2 = DirectMessageChat(dmNode: 2);

    expect(d1 == d2, isFalse);
  });

  test('DirectMessageChat hashcode equals', () async {
    const d1 = DirectMessageChat(dmNode: 1);
    const d2 = DirectMessageChat(dmNode: 1);

    expect(d1.hashCode == d2.hashCode, isTrue);
  });

  test('DirectMessageChat hashcode not equals', () async {
    const d1 = DirectMessageChat(dmNode: 1);
    const d2 = DirectMessageChat(dmNode: 2);

    expect(d1.hashCode == d2.hashCode, isFalse);
  });

  test('ChannelChat equals', () async {
    const c1 = ChannelChat(channel: 1);
    const c2 = ChannelChat(channel: 1);

    expect(c1 == c2, isTrue);
  });

  test('ChannelChat not equals', () async {
    const c1 = ChannelChat(channel: 1);
    const c2 = ChannelChat(channel: 2);

    expect(c1 == c2, isFalse);
  });

  test('ChannelChat hashcode equals', () async {
    const c1 = ChannelChat(channel: 1);
    const c2 = ChannelChat(channel: 1);

    expect(c1.hashCode == c2.hashCode, isTrue);
  });

  test('ChannelChat hashcode not equals', () async {
    const c1 = ChannelChat(channel: 1);
    const c2 = ChannelChat(channel: 2);

    expect(c1.hashCode == c2.hashCode, isFalse);
  });

  test('ChannelChat & DirectMessageChat not equals', () async {
    const c1 = ChannelChat(channel: 1);
    const d1 = DirectMessageChat(dmNode: 1);

    expect(c1 == d1, isFalse);
    expect(c1.hashCode == d1.hashCode, isFalse);
  });
}
