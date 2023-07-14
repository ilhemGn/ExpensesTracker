import 'package:expense_tracking_app/constants.dart';
import 'package:expense_tracking_app/models/expense_model.dart';
import 'package:expense_tracking_app/widgets/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui' as ui;

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
    ExpenseModel(
      title: 'Sport',
      amount: 20.38,
      date: DateTime.now(),
      category: Category.sport,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F7),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: () {},
        child: const Icon(
          Icons.add_rounded,
          size: 30,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF3F5F7),
        leadingWidth: 80,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Image.asset(
            'assets/images/money.png',
          ),
        ),
        title: const Text(
          'Welcome !',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Chart'),
            Expanded(child: ExpensesList(expenses: expensesList)),
          ],
        ),
      ),
    );
  }
}
