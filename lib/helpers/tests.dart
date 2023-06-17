List<int> berlekampMassey(List<int> sequence) {
  int n = sequence.length;
  List<int> c = List<int>.filled(n, 0);
  List<int> b = List<int>.filled(n, 0);
  c[0] = 1;
  b[0] = 1;

  int L = 0;
  int m = -1;
  int N = 0;

  while (N < n) {
    // calculate discrepancy d
    int d = sequence[N];
    for (int i = 1; i <= L; i++) {
      d ^= (c[i] & sequence[N - i]);
    }

    if (d == 1) {
      List<int> temp = List<int>.from(c);
      // calculate new coefficients
      for (int i = N - m; i < n; i++) {
        c[i] ^= b[i - (N - m)];
      }
      // if 2L <= N then change L and b
      if (2 * L <= N) {
        L = N + 1 - L;
        m = N;
        b = List<int>.from(temp);
      }
    }
    N += 1;
  }

  return c.getRange(0, L + 1).toList();
}

List<int> generateSequenceFromLfsr(List<int> lfsr, int length) {
  List<int> sequence = List<int>.filled(length, 0);
  List<int> state =
      List<int>.generate(lfsr.length - 1, (_) => 1, growable: true);

  for (int i = 0; i < length; i++) {
    int newBit = 0;
    for (int j = 0; j < state.length; j++) {
      newBit ^= lfsr[j + 1] & state[j];
    }
    sequence[i] = newBit;
    state.insert(0, newBit);
    state.removeLast();
  }

  return sequence;
}

List<int> bma(List<int> sequence) {
  int N = sequence.length;
  List<int> C = List.filled(N, 0);
  List<int> B = List.filled(N, 0);
  C[0] = B[0] = 1;

  int L = 0, m = -1;

  for (int n = 0; n < N; n++) {
    int d = sequence[n];
    for (int i = 1; i <= L; i++) {
      d ^= C[i] & sequence[n - i];
    }

    if (d == 1) {
      List<int> T = List.from(C);
      for (int i = 0; (n - m + i) < N; i++) {
        C[n - m + i] ^= B[i];
      }

      if (L <= n / 2) {
        L = n + 1 - L;
        m = n;
        B = T;
      }
    }
  }

  return C.sublist(0, L + 1);
}

List<int> reverseTaps(List<int> lis) {
  lis.sort((a, b) => b.compareTo(a));

  for (int i = 1; i < lis.length - 1; i++) {
    lis[i] = lis[0] - lis[i];
  }

  lis.sort((a, b) => b.compareTo(a));

  return lis;
}
