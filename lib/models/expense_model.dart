import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

//To generate a unique string id
const uuid = Uuid();

enum Category { food, work, study, sport, leisure }

final categoryImages = {
  Category.food: 'assets/images/food.png',
  Category.work: 'assets/images/work.png',
  Category.study: 'assets/images/books.png',
  Category.sport: 'assets/images/sport.png',
  Category.leisure: 'assets/images/leisure.png',
};

final formatter = DateFormat.yMd();

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}
