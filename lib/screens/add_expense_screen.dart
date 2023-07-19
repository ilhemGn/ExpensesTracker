import 'dart:io';

import 'package:expense_tracking_app/constants.dart';
import 'package:expense_tracking_app/models/expense_model.dart';
import 'package:expense_tracking_app/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracking_app/widgets/input_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  var _enteredTitle = '';
  var _enteredAmount = '';
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  final _formKey = GlobalKey<FormState>();

  void _showDialog() {
    if (Platform.isAndroid) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text(
                  'Reset form?',
                  textAlign: TextAlign.center,
                ),
                content: const Text(
                  'Do you want to rest this form',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _formKey.currentState!.reset();
                      },
                      child: const Text('Confirm')),
                ],
              ));
    } else {
      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
                title: const Text(
                  'Reset form?',
                  textAlign: TextAlign.center,
                ),
                content: const Text(
                  'Do you want to rest this form',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _formKey.currentState!.reset();
                      },
                      child: const Text('Confirm')),
                ],
              ));
    }
  }

  void _submittedForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(
          context,
          ExpenseModel(
              title: _enteredTitle,
              amount: double.parse(_enteredAmount),
              date: _selectedDate!,
              category: _selectedCategory));
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 117, 117, 117),
        child: Container(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
            top: 30,
            bottom: keyboardSpace,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            color: Colors.white,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                InputField(
                  hintText: 'Expense Details',
                  labelText: 'Title',
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Must be between 1 & 50 characteres';
                    }

                    return null;
                  },
                  onSave: (value) {
                    _enteredTitle = value!;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InputField(
                        keyboardType: TextInputType.number,
                        prefixText: '\$',
                        hintText: '0.00',
                        labelText: 'Amount',
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              double.tryParse(value) == null ||
                              double.tryParse(value)! < 1) {
                            return 'Must be a valid amount';
                          }

                          return null;
                        },
                        onSave: (value) {
                          _enteredAmount = value!;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _selectedDate == null
                              ? 'No Selected Date'
                              : formatter.format(_selectedDate!),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 133, 168, 151)),
                        ),
                        IconButton(
                            onPressed: () async {
                              final now = DateTime.now();
                              final firstdate =
                                  DateTime(now.year - 1, now.month, now.day);
                              DateTime? pickerDate = await showDatePicker(
                                  context: context,
                                  initialDate: now,
                                  firstDate: firstdate,
                                  lastDate: now);

                              setState(() {
                                _selectedDate = pickerDate;
                              });
                            },
                            icon: const Icon(
                              FontAwesomeIcons.solidCalendarDays,
                              size: 20,
                              color: kMainColor,
                            ))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField(
                  value: _selectedCategory,
                  decoration: const InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: RoundedButton(
                        text: 'Cancel',
                        onPress: _showDialog,
                        cancel: true,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                        child: RoundedButton(
                            text: 'Add', onPress: _submittedForm)),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
