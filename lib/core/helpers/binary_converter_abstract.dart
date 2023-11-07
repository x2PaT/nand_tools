import 'dart:typed_data';

abstract class IBinaryConverter {
  /// Converts a list of bits to an integer byte (8 bits maximum).
  ///
  /// Example:
  /// ```dart
  /// IBinaryConverter converter = BinaryConverter();
  /// List<int> bits = [1, 0, 1, 1, 0, 0, 1, 0];
  /// int byte = converter.bitsToByte(bits); // Result: 178
  /// ```
  int bitsToByte(List<int> bits);

  /// Converts an integer byte to a list of bits.
  ///
  /// Example:
  /// ```dart
  /// IBinaryConverter converter = BinaryConverter();
  /// List<int> bitsFromByte = converter.byteToBits(178); // Result: [1, 0, 1, 1, 0, 0, 1, 0]
  /// ```
  List<int> byteToBits(int byte);

  /// Converts an integer byte to its hexadecimal representation.
  ///
  /// Example:
  /// ```dart
  /// IBinaryConverter converter = BinaryConverter();
  /// String hex = converter.intByteToHex(178); // Result: 'B2'
  /// ```
  String intByteToHex(int byte);

  /// Converts a hexadecimal string to an integer byte.
  ///
  /// Example:
  /// ```dart
  /// IBinaryConverter converter = BinaryConverter();
  /// int byteFromHex = converter.hexToIntByte('B2'); // Result: 178
  /// ```
  int hexToIntByte(String hex);

  /// Converts a list of bits to a Uint8List of bytes.
  ///
  /// Example:
  /// ```dart
  /// IBinaryConverter converter = BinaryConverter();
  /// Uint8List bytesFromBits = converter.bitsToBytes([1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1]);
  /// ```
  Uint8List bitsToBytes(List<int> bits);

  /// Converts a Uint8List of bytes to a list of bits.
  ///
  /// Example:
  /// ```dart
  /// IBinaryConverter converter = BinaryConverter();
  /// List<int> bitsFromBytes = converter.bytesToBits(Uint8List.fromList([178, 51]));
  /// ```
  List<int> bytesToBits(Uint8List bytes);

  /// Converts a Uint8List to a list of integers.
  ///
  /// Example:
  /// ```dart
  /// IBinaryConverter converter = BinaryConverter();
  /// Uint8List uint8List = Uint8List.fromList([10, 20, 30]);
  /// List<int> bytesList = converter.uint8ListToBytesList(uint8List);
  /// ```
  List<int> uint8ListToBytesList(Uint8List list);

  /// Converts a list of integers to a Uint8List.
  ///
  /// Example:
  /// ```dart
  /// IBinaryConverter converter = BinaryConverter();
  /// List<int> bytesListToConvert = [15, 25, 35];
  /// Uint8List uint8ListFromList = converter.bytesListToUint8List(bytesListToConvert);
  /// ```
  Uint8List bytesListToUint8List(List<int> list);
}
