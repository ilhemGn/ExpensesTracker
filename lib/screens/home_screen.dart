import 'package:expense_tracking_app/models/expense_model.dart';
import 'package:expense_tracking_app/screens/add_expense_screen.dart';
import 'package:expense_tracking_app/widgets/chart/char.dart';
import 'package:expense_tracking_app/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ExpenseModel> expensesList = [
    ExpenseModel(
      title: 'Flutter course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.study,
    ),
    ExpenseModel(
      title: 'Sport',
      amount: 20.38,
      date: DateTime.now(),
      category: Category.sport,
    ),
    ExpenseModel(
      title: 'Flutter course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.food,
    ),
    ExpenseModel(
      title: 'Sport',
      amount: 20.38,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpenseModel(
      title: 'Flutter course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _addExpense(ExpenseModel expense) {
    setState(() {
      expensesList.add(expense);
    });
  }

  void _removeExpense(ExpenseModel expense) {
    int expenseIndex = expensesList.indexOf(expense);
    setState(() {
      expensesList.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense deleted'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              expensesList.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              //isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (ctx) => AddExpenseScreen(
                    addNewExpense: _addExpense,
                  ));
        },
        child: const Icon(
          Icons.add_rounded,
          size: 30,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 80,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Image.asset(
            'assets/images/money1.png',
          ),
        ),
        title: const Text(
          'Welcome !',
        ),
      ),
      body: expensesList.isEmpty
          ? const Center(
              child: Text(
              'No Expenses was added, Try add some!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ))
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Chart(expenses: expensesList),
                  Expanded(
                      child: ExpensesList(
                    expenses: expensesList,
                    removeExpense: _removeExpense,
                  )),
                ],
              ),
            ),
    );
  }
}
