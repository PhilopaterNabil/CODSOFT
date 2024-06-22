import 'package:expense_tracker/constants/my_primary_colors.dart';
import 'package:expense_tracker/firebase_options.dart';
import 'package:expense_tracker/screens/home/views/home_screen.dart';
import 'package:expense_tracker/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  runApp(const ExpenseTracker());
}

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Epense Tracker',
      theme: myThemeData(),
      home: const HomeScreen(),
    );
  }

  ThemeData myThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: MyPrimaryColors.myLightBlue,
        secondary: MyPrimaryColors.myPurple,
        tertiary: MyPrimaryColors.myOrange,
        surface: Colors.grey.shade100,
        onSurface: Colors.black,
        outline: Colors.grey,
      ),
      useMaterial3: true,
    );
  }
}
