import 'package:expenseapp/models/expense.dart';
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
        name: "Yiyecek",
        price: 200,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: "Flutter Udemy Course",
        price: 200,
        date: DateTime.now(),
        category: Category.education),
  ]; // firebase,veritabanı

  // ListView render

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              return Text(expenses[index].name);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 300, bottom: 30),
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Colors.green,
          ),
        ),
      ],
    );
  }
}
