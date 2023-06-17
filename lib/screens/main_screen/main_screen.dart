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
