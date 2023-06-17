import 'package:flutter/material.dart';

import '../../helpers/binary_helpers.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NAND tools'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                calculate();
              },
              child: const Text(
                'Calculate LFSR',
              ),
            )
          ],
        ),
      ),
    );
  }
}

calculate() {
  final List<int> a = hexStringToIntList('EF E2 F2 BA');
  final List<int> b = bytesToBits(a);
}
