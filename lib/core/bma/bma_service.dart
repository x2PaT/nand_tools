class BMAService {
  static List<int> bma(List<int> stream) {
    int n = stream.length;

    // polynomials
    List<int> s = List<int>.from(stream);
    List<int> b = List<int>.filled(n, 0);
    b[0] = 1;
    List<int> c = List<int>.filled(n, 0);
    c[0] = 1;

    int L = 0; // length of minimal LFSR
    int m = -1; // number of iterations since the last update

    for (int N = 0; N < n; N++) {
      // calculate discrepancy
      int d = s[N];
      for (int i = 1; i <= L; i++) {
        d ^= c[i] & s[N - i];
      }

      // if discrepancy is zero; annihilation continues
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
