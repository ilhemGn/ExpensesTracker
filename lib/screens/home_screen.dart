import 'package:expense_tracking_app/constants.dart';
import 'package:expense_tracking_app/http/http_requests.dart';
import 'package:expense_tracking_app/models/expense_model.dart';
import 'package:expense_tracking_app/screens/add_expense_screen.dart';
import 'package:expense_tracking_app/widgets/chart/char.dart';
import 'package:expense_tracking_app/widgets/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isLoading = true;

  void _removeExpense(ExpenseModel expense) async {
    int expenseIndex = loadedExpList.indexOf(expense);
    setState(() {
      loadedExpList.remove(expense);
    });

    int reqState = await removeItem(expense);

    if (reqState >= 400) {
      setState(() {
        loadedExpList.insert(expenseIndex, expense);
      });
      if (!context.mounted) {
        return;
      }

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Expense has not been deleted, try later'),
        duration: Duration(seconds: 3),
      ));
      return;
    }
    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense deleted'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              loadedExpList.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  List<ExpenseModel> loadedExpList = [];

  //fetchData
  void _loadData() async {
    List<ExpenseModel> tmpExpList = await getData();
    setState(() {
      loadedExpList = tmpExpList;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //to avoid extra request, we can return the new expense added from the
          //add _expense screen and display it instantly in the expense list
          //without making another request to the server to fetch data

          var newExpense = await showModalBottomSheet(
              //isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (ctx) => const AddExpenseScreen());

          if (newExpense == null) {
            return;
          }
          setState(() {
            loadedExpList.add(newExpense);
          });

          // _loadData();
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
      body: _isLoading
          ? Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.height * 0.2,
                child: const LoadingIndicator(
                  indicatorType: Indicator.ballPulseRise,
                  colors: [kMainColor],
                  //strokeWidth: 0.5,
                ),
              ),
            )
          : loadedExpList.isEmpty
              ? const Center(
                  child: Text(
                  'No Expenses was added, Try add some!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ))
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Chart(expenses: loadedExpList),
                      Expanded(
                          child: ExpensesList(
                        expenses: loadedExpList,
                        removeExpense: _removeExpense,
                      )),
                    ],
                  ),
                ),
    );
  }
}
