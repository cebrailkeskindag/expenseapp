import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  // dummy data
  final List<Expense> expenses = [
    Expense(
        name: "Pizza",
        price: 200.65,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: "Mühendis",
        price: 45000,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        name: "Uludag Turu",
        price: 2500.65,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        name: "Flutter Udemy Course",
        price: 10500,
        date: DateTime.now(),
        category: Category.education),
  ]; // firebase,veritabanı

  // ListView render

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
            child: Text(
              "Grafik",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Expense Listesi",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return ExpenseItem(expenses[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
