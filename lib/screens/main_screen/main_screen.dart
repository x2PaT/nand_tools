import 'package:flutter/material.dart';
import 'package:nand_tools/core/bma/bma_test_seq.dart';

import '../../core/bma/bma_service.dart';

class MainScreen extends StatefulWidget {
  MainScreen({
    super.key,
  });

  final input = BmaTestSequences.testSeq1;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<int> result = [];

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
            Text('LFSR Length: ${result.length - 1}'),
            Text('LFSR Coefficients: $result'),
            Text('LFSR taps: ${result.where((e) => e == 1).length - 1}'),
            TextButton(
              onPressed: () {
                setState(() {
                  result = BMAService.bma(widget.input);
                });
              },
              child: const Text(
                'Calculate bma',
              ),
            )
          ],
        ),
      ),
    );
  }
}
