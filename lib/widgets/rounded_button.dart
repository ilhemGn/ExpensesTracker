import 'package:flutter/material.dart';
import 'package:expense_tracking_app/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  final bool? cancel;

  const RoundedButton({
    required this.text,
    required this.onPress,
    this.cancel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: cancel == null ? kMainColor : Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(20),
            ))),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: cancel == null ? Colors.white : Colors.black54),
        ),
      ),
    );
  }
}
