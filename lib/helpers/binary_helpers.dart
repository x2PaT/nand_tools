import '../utils.dart';

void bitsToBytesTest() {
  final bytes = [0xFE, 0xFE, 0xFE];

  final bits = bytesToBits(bytes);

  final bytes2 = bitsToBytes(bits);

  printW(bytes.toHex());
  printW(bytes2.toHex());
}

List<int> bytesToBits(List<int> bytes) {
  List<int> bits = [];
  for (int byte in bytes) {
    String binaryString = byte.toRadixString(2).padLeft(8, '0');
    for (int i = 0; i < binaryString.length; i++) {
      bits.add(int.parse(binaryString[i]));
    }
  }
  return bits;
}

extension ListIntExtension on List<int> {
  List<String> toHex() {
    return map((byte) {
      return '0x${byte.toRadixString(16).toUpperCase().padLeft(2, '0')}';
    }).toList();
  }
}

List<int> bitsToBytes(List<int> bits) {
  List<int> bytes = [];
  for (int i = 0; i < bits.length; i += 8) {
    int byte = 0;
    for (int j = 0; j < 8 && i + j < bits.length; j++) {
      byte = (byte << 1) | bits[i + j];
    }
    bytes.add(byte);
  }
  return bytes;
}

List<int> hexStringToIntList(String hexString) {
  return hexString
      .split(' ')
      .map((hexByte) => int.parse(hexByte, radix: 16))
      .toList();
}
