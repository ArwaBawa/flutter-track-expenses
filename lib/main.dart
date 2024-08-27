import 'package:flutter/material.dart';
import 'package:flutter_expense/Providers/themeProvider.dart';
import 'package:flutter_expense/model/expense.dart';
import 'package:flutter_expense/pages/WelcomePage.dart';
import 'package:flutter_expense/theme/AppTheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

 void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseAdapter());
  
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, 
      darkTheme: AppTheme.darkTheme, 
      themeMode: themeMode, 
      home: WelcomePage(),
    );
  }
}