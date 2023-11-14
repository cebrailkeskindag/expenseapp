import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {Key? key}) : super(key: key);
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                expense.name,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 8),
                Icon(categoryIcons[expense.category]),
                const SizedBox(width: 8),
                Text(expense.formattedDate),
                const Spacer(),
                Text("${expense.price.toStringAsFixed(2)} ₺"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
