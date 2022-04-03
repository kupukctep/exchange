import 'package:flutter/material.dart';

class DepositPage extends StatelessWidget {
  const DepositPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Make a deposit"),
      ),
      body: const Center(child: Text("Let's deposit some money!")),
    );
  }
}

