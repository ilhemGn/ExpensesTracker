import 'package:flutter/material.dart';
import 'package:expense_tracking_app/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function() onPress;

  const RoundedButton({
    required this.text,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: kMainColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(20),
            ))),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
