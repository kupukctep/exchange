import 'package:exchange_flutter/pages/deposit_page.dart';
import 'package:flutter/material.dart';

class CashPage extends StatefulWidget {
  const CashPage({Key? key}) : super(key: key);

  @override
  State<CashPage> createState() => _CashPageState();
}

class _CashPageState extends State<CashPage> {
  int _amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cash"),
        ),
        body: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text("EUR"), Text("$_amount")],
                ),
                ElevatedButton(
                    onPressed: () {
                      _openAndAwaitDeposit(context);
                    },
                    child: const Text("Deposit"))
              ],
            )));
  }

  void _openAndAwaitDeposit(BuildContext context) async {
    final DepositFormValue? result = await Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => const DepositPage())
    );

    setState(() {
       var depositAmount = result?.amount ?? 0;
      _amount = _amount + depositAmount;
    });
  }
}
