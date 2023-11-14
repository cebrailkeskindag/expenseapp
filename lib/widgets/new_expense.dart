import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // Controller
  DateTime dateTime = DateTime.now();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Expense Name")),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(label: Text("Amount"), prefixText: "₺"),
          ),
          IconButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: dateTime,
                  firstDate: DateTime.utc(2013),
                  lastDate: DateTime.utc(2030),
                );

                if (picked == null) return;
                setState(() {
                  dateTime = picked;
                });
                // DatePicker açmak..
                // DatePicker'dan gelen değeri Text olarak yazdırmak
              },
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: const Icon(
                  Icons.calendar_month,
                  size: 36,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Text(
                DateFormat.yMd().format(dateTime),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const Text(
            "Tarih Seçiniz..",
            style: TextStyle(fontSize: 18),
          ), // seçilen tarihi formatlayarak yazdırmak..

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () {
                print("Kayıt başarılı: ${_nameController.text}");
              },
              child: const Text("Kaydet"),
              style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
            ),
          ),
        ],
      ),
    );
  }
}
