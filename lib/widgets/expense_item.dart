import 'package:flutter/material.dart';
import 'package:expense_tracking_app/models/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  final ExpenseModel expense;
  const ExpenseItem({required this.expense, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white),
              child: Image.asset(
                categoryImages[expense.category] ?? 'assets/images/money.png',
                width: 30,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        expense.title,
                        style: Theme.of(context)
                            .appBarTheme
                            .titleTextStyle!
                            .copyWith(fontSize: 16),
                      ),
                      Text(
                        '\$${expense.amount.toStringAsFixed(2)}',
                        style: Theme.of(context)
                            .appBarTheme
                            .titleTextStyle!
                            .copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    expense.formattedDate,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
