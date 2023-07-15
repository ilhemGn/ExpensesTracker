import 'package:expense_tracking_app/models/expense_model.dart';
import 'package:expense_tracking_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpensesList extends StatelessWidget {
  final List<ExpenseModel> expenses;
  final Function(ExpenseModel) removeExpense;

  const ExpensesList(
      {required this.expenses, required this.removeExpense, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: ((context, index) => Dismissible(
            background: Card(
              margin: const EdgeInsets.all(10),
              color: Theme.of(context).colorScheme.error.withOpacity(0.8),
              child: Container(
                padding: const EdgeInsets.only(right: 30),
                alignment: Alignment.centerRight,
                child: const Icon(
                  FontAwesomeIcons.trashCan,
                  color: Colors.white,
                ),
              ),
            ),
            onDismissed: (direction) => removeExpense(expenses[index]),
            key: ValueKey(expenses[index]),
            child: ExpenseItem(expense: expenses[index]))));
  }
}
