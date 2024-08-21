import 'package:flutter/material.dart';
import 'package:flutter_expense/model/expense.dart';
import 'package:flutter_expense/pages/WelcomePage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

 void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseAdapter());
  
  runApp(ProviderScope(child: MyApp(savedThemeMode: savedThemeMode)));
}

class MyApp extends StatelessWidget{
 final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});
  @override
  Widget build(BuildContext context){
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: const Color.fromARGB(255, 192, 154, 230),
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color.fromARGB(255, 62, 28, 95),
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: darkTheme,
      home: WelcomePage(),
    ),
   debugShowFloatingThemeButton: true,

    );
  }
}
