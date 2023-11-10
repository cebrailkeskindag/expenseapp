import 'package:expenseapp/pages/expense_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade300,
          title: const Text(
            "Expense App",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
        body: ExpenseList(),
      ),
    ),
  );
}
