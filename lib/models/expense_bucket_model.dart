import 'package:expense_tracking_app/models/expense_model.dart';

class ExpenseBucketModel {
  final Category category;
  final List<ExpenseModel> expenses;

  ExpenseBucketModel.forCategory(List<ExpenseModel> allexpenses, this.category)
      : expenses = allexpenses
            .where(
              (expense) => expense.category == category,
            )
            .toList();

  ExpenseBucketModel({required this.category, required this.expenses});

  double get totalExpense {
    double sum = 0;

    for (var expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
