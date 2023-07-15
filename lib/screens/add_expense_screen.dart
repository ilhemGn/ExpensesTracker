import 'package:expense_tracking_app/constants.dart';
import 'package:expense_tracking_app/models/expense_model.dart';
import 'package:expense_tracking_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracking_app/widgets/input_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 117, 117, 117),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            InputField(
                controller: _titleController,
                hintText: 'Expense Details',
                labelText: 'Title'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InputField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      prefixText: '\$',
                      hintText: '0.00',
                      labelText: 'Amount'),
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
                          color: Color.fromARGB(255, 126, 143, 151)),
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
                          color: Colors.blueGrey,
                        ))
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: RoundedButton(
                    text: 'Cancel',
                    onPress: () {},
                    cancel: true,
                  ),
                ),
                const Spacer(),
                Expanded(
                    child: RoundedButton(
                        text: 'Add',
                        onPress: () {
                          print(_titleController.text);
                          print(_amountController.text);
                        })),
              ],
            )
          ],
        ),
      ),
    );
  }
}
