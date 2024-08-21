import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense/pages/HomePage.dart';
import 'package:flutter_expense/theme/color.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current theme mode
    final isDarkMode = AdaptiveTheme.of(context).mode.isDark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [
                    AppColors.darkBackground, 
                    AppColors.darkAppBar, 
                  ]
                : [
                    AppColors.lightBackground,
                    AppColors.lightAppBar, 
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/welcome.png'),
              // Space
              SizedBox(height: 50.0),
              
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: isDarkMode
                        ? AppColors.darkButtonIcon // Button text color for dark mode
                        : AppColors.lightButtonIcon, // Button text color for light mode
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode
                      ? AppColors.darkButton // Button background color for dark mode
                      : AppColors.lightButton, // Button background color for light mode
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Optional: Add a theme switcher
              SizedBox(height: 20.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Light', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 10),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      if (value) {
                        AdaptiveTheme.of(context).setDark();
                      } else {
                        AdaptiveTheme.of(context).setLight();
                      }
                    },
                  ),
                  const SizedBox(width: 10),
                  const Text('Dark', style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
