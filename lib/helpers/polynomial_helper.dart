String coefficientsToPolynomial(List<int> coefficients) {
  List<String> terms = [];
  for (int i = 0; i < coefficients.length; i++) {
    if (coefficients[i] == 1) {
      if (i == 0) {
        terms.add('1');
      } else if (i == 1) {
        terms.add('x');
      } else {
        terms.add('x^$i');
      }
    }
  }
  return terms.reversed.join(' + ');
}

List<int> polynomialToCoefficients(String polynomial) {
  List<int> coefficients = [];
  List<String> terms = polynomial.split(' + ');
  for (String term in terms.reversed) {
    if (term == '1') {
      coefficients.add(1);
    } else {
      int exponent = int.parse(term.split('^')[1]);
      while (coefficients.length < exponent) {
        coefficients.add(0);
      }
      coefficients.add(1);
    }
  }
  return coefficients;
}
