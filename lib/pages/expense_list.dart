import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList(this.expenses, this.onRemove, {Key? key}) : super(key: key);
  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  List<Expense> removedExpenses = [];

  void undoRemoveExpense(int index) {
    Expense removedExpense = removedExpenses.removeAt(0);
    setState(() {
      widget.expenses.insert(index, removedExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
            child: Text("Grafik"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(widget.expenses[index]),
                  child: ExpenseItem(widget.expenses[index]),
                  onDismissed: (direction) {
                    Expense removedExpense = widget.expenses[index];
                    widget.onRemove(removedExpense);
                    setState(() {
                      removedExpenses.add(removedExpense);
                    });
                    final snackBar = SnackBar(
                      backgroundColor: Colors.grey.shade200,
                      content: const Text(
                        "Harcama listesini sildiniz!",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      action: SnackBarAction(
                        backgroundColor: Colors.green,
                          label: "Geri al", textColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              undoRemoveExpense(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.grey.shade200,
                                  content: const Text(
                                    "geri alındı.",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 16),
                                  ),
                                ),
                              );
                            });
                          }),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
// Topbar eklemek vs..