class BMAService {
  /// Berlekamp-Massey Algorithm (BMA) to find the shortest LFSR (Linear Feedback Shift Register)
  /// that generates the given stream of numbers.
  ///
  /// The BMA algorithm takes a list of integers (stream) as input and returns the coefficients
  /// of the polynomial that represents the shortest LFSR capable of generating that stream.
  ///
  /// The function takes a List<int> `stream` as input and returns a List<int> containing the
  /// coefficients of the polynomial that represents the shortest LFSR.
  ///
  /// Example:
  /// ```dart
  ///   // Define the input sequence for which to find the LFSR polynomial
  ///   List<int> inputSequence = [0, 1, 1, 0, 1, 0, 1];
  ///
  ///   // Finding the LFSR polynomial coefficients using BMA
  ///   List<int> coefficients = bma(inputSequence);
  /// ```
  static List<int> bma(List<int> stream) {
    int n = stream.length;

    // polynomials
    List<int> s = List<int>.from(stream);
    List<int> b = List<int>.filled(n, 0);
    b[0] = 1;
    List<int> c = List<int>.filled(n, 0);
    c[0] = 1;

    int L = 0;
    int m = -1;

    for (int N = 0; N < n; N++) {
      int d = s[N];
      for (int i = 1; i <= L; i++) {
        d ^= c[i] & s[N - i];
      }

      if (d == 1) {
        List<int> t = List<int>.from(c);
        for (int i = 0; i < n - N + m; i++) {
          c[i + N - m] ^= b[i];
        }
        if (L <= N ~/ 2) {
          L = N + 1 - L;
          m = N;
          b = List<int>.from(t);
        }
      }
    }

    return c.sublist(0, L + 1);
  }
}
