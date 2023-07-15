import 'package:expense_tracking_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracking_app/widgets/rounded_button.dart';
import 'package:expense_tracking_app/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(120),
                  bottomRight: Radius.circular(120)),
              image: DecorationImage(
                alignment: Alignment.center,
                image: AssetImage('assets/images/ExpenseTracker.png'),
              ),
              color: kMainColor,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Easy way to Track your Expenses',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                const Text(
                  'All your financial activities will be recorded and displayed briefly and clearly',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(221, 178, 175, 175),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 30),
                RoundedButton(
                  text: 'Get Started',
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
