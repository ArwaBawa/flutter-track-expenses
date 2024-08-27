import 'package:flutter/material.dart';
import 'package:flutter_expense/Providers/themeProvider.dart';
import 'package:flutter_expense/pages/HomePage.dart';
import 'package:flutter_expense/theme/text_styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode =
        ref.watch(themeModeProvider); // Watch the theme mode provider

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Switch mode", style: AppTextStyles.body),
            Switch(
                value: themeMode == ThemeMode.dark,
                onChanged: (value) {
                  ref.read(themeModeProvider.notifier).state =
                      value ? ThemeMode.dark : ThemeMode.light;
                }),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/welcome.png'),
              // Space
              SizedBox(height: 50.0),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
                child: Text(
                  "Get Started",
                  style: AppTextStyles.button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
