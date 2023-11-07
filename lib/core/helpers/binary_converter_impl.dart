import 'dart:typed_data';

import 'binary_converter_abstract.dart';

class BinaryConverter implements IBinaryConverter {
  @override
  int bitsToByte(List<int> bits) {
    if (bits.length > 8) {
      throw ArgumentError('Bits list should contain max 8 elements.');
    }

    int byte = 0;
    for (int i = 0; i < bits.length; i++) {
      byte = (byte << 1) | bits[i];
    }
    return byte;
  }

  @override
  List<int> byteToBits(int byte) {
    if (byte < 0 || byte > 255) {
      throw ArgumentError('Byte value should be between 0 and 255.');
    }

    List<int> bits = [];
    for (int i = 7; i >= 0; i--) {
      bits.add((byte >> i) & 1);
    }
    return bits;
  }

  @override
  int hexToIntByte(String hex) {
    return int.parse(hex, radix: 16);
  }

  @override
  String intByteToHex(int byte) {
    if (byte < 0 || byte > 255) {
      throw ArgumentError('Byte value should be between 0 and 255.');
    }

    return byte.toRadixString(16).toUpperCase().padLeft(2, '0');
  }

  @override
  Uint8List bitsToBytes(List<int> bits) {
    if (bits.length % 8 != 0) {
      throw ArgumentError('Bits list length should be a multiple of 8.');
    }

    int bytesCount = bits.length ~/ 8;
    Uint8List bytes = Uint8List(bytesCount);

    for (int i = 0; i < bytesCount; i++) {
      List<int> byteBits = bits.sublist(i * 8, (i + 1) * 8);
      bytes[i] = bitsToByte(byteBits);
    }

    return bytes;
  }

  @override
  List<int> bytesToBits(Uint8List bytes) {
    List<int> bits = [];

    for (int i = 0; i < bytes.length; i++) {
      List<int> byteBits = byteToBits(bytes[i]);
      bits.addAll(byteBits);
    }

    return bits;
  }

  @override
  List<int> uint8ListToBytesList(Uint8List list) {
    return List<int>.from(list);
  }

  @override
  Uint8List bytesListToUint8List(List<int> list) {
    return Uint8List.fromList(list);
  }
}
