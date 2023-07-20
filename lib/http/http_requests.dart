import 'package:expense_tracking_app/models/expense_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

final url =
    Uri.https('flutter-apps-e625a-default-rtdb.firebaseio.com', 'Expense.json');

void postData(ExpenseModel expense) async {
  try {
    var response = await http.post(
      url,
      headers: {'Content_Type': 'application/json'},
      body: jsonEncode({
        'title': expense.title,
        'amount': expense.amount,
        'date': formatter.format(expense.date),
        'category': expense.category.name,
      }),
    );
    print(response.statusCode);
  } catch (e) {
    print(e);
  }
}

Future<List<ExpenseModel>> getData() async {
  List<ExpenseModel> loadedExpense = [];

  try {
    http.Response response = await http.get(url);

    if (response.body == 'null') {
      return loadedExpense;
    }

    Map<String, dynamic> listData = jsonDecode(response.body);

    for (final expense in listData.entries) {
      loadedExpense.add(ExpenseModel(
        id: expense.key,
        title: expense.value['title'],
        amount: expense.value['amount'],
        date: DateFormat('d/M/y').parse(expense.value['date']),
        category: Category.values.firstWhere(
            (category) => category.name == expense.value['category']),
      ));
    }
  } catch (e) {
    print(e);
  }
  return loadedExpense;
}

Future<int> removeItem(ExpenseModel expense) async {
  final url = Uri.https('flutter-apps-e625a-default-rtdb.firebaseio.com',
      'Expense/${expense.id}.json');

  var response;

  try {
    response = await http.delete(url);
  } catch (e) {
    print(e);
  }

  return response.statusCode;
}
