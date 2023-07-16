import 'package:expense_tracking_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracking_app/screens/welcome_screen.dart';
import 'package:flutter/services.dart';

void main() {
  //To locking device orientation in portrai up mode only
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((val) => runApp(const MyApp()));

  //if you want to allow portrait down we should remove 
  //this part of code and use Media Query to get available
  //space in width and high then we can change the widget 
  //depending on available space device.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(
            titleTextStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        )),
      ),
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kSchemeColor,
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData().copyWith(
            backgroundColor: kMainColor,
            foregroundColor: Colors.white,
          ),
          appBarTheme: const AppBarTheme().copyWith(
              titleTextStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          )),
          datePickerTheme: const DatePickerThemeData().copyWith(
            backgroundColor: kBackGDateBickerColor,
          ),
          inputDecorationTheme:
              const InputDecorationTheme().copyWith(fillColor: kFilledColor)),
      title: 'Expense Tracker',
      home: const WelcomeScreen(),
    );
  }
}
