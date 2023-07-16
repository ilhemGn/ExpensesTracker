import 'package:expense_tracking_app/models/expense_model.dart';

List<ExpenseModel> expensesList = [
  ExpenseModel(
    title: 'Books',
    amount: 19.99,
    date: DateTime(2023, 07, 16),
    category: Category.study,
  ),
  ExpenseModel(
    title: 'Lunch with colleagues',
    amount: 25.0,
    date: DateTime(2023, 07, 15),
    category: Category.work,
  ),
  ExpenseModel(
    title: 'Gym membership',
    amount: 29.99,
    date: DateTime(2023, 07, 14),
    category: Category.sport,
  ),
  ExpenseModel(
    title: 'Movie night',
    amount: 12.5,
    date: DateTime(2023, 07, 12),
    category: Category.leisure,
  ),
  ExpenseModel(
    title: 'Dinner at a restaurant',
    amount: 45.75,
    date: DateTime(2023, 7, 9),
    category: Category.food,
  ),
  ExpenseModel(
    title: 'Soccer shoes',
    amount: 29.95,
    date: DateTime(2023, 7, 11),
    category: Category.sport,
  ),
];
