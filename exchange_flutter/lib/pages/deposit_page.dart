import 'package:flutter/material.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({Key? key}) : super(key: key);

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class DepositFormValue {
  String? currency;
  int amount = 0;
}

class _DepositPageState extends State<DepositPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<DropdownMenuItem<String>> currencyItems = [
    const DropdownMenuItem(child: Text("USD"), value: "USD"),
    const DropdownMenuItem(child: Text("EUR"), value: "EUR"),
  ];

  final DepositFormValue value = DepositFormValue();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Deposit funds")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField(
                  items: currencyItems,
                  hint: const Text("Pick a currency"),
                  onChanged: (item) => value.currency = item as String?),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: "0",
                decoration:
                    const InputDecoration(hintText: 'Enter deposit amount'),
                onChanged: (v) => value.amount = int.tryParse(v) ?? 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("Deposit"),
                  onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("${value.amount} ${value.currency}");
                        Navigator.pop(context, value);
                      }
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
