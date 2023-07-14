import 'package:expense_tracking_app/models/expense_model.dart';
import 'package:expense_tracking_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<ExpenseModel> expenses;

  const ExpensesList({required this.expenses, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: ((context, index) =>
            ExpenseItem(expense: expenses[index])));
  }
}
