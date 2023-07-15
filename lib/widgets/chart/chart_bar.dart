import 'package:expense_tracking_app/constants.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });

  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: const DecoratedBox(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color.fromARGB(255, 111, 207, 186),
                      Color(0xff4CA1AF),
                    ])
                //color: kMainColor,
                // isDarkMode
                //     ? Theme.of(context).colorScheme.secondary
                //     : Theme.of(context).colorScheme.onErrorContainer.withOpacity(0.65),
                ),
          ),
        ),
      ),
    );
  }
}
