import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expense/Providers/dateProvider.dart';
import 'package:flutter_expense/Providers/view_expense%7C_provider.dart';
import 'package:flutter_expense/theme/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Add_expense extends ConsumerWidget {
  const Add_expense({super.key});

  Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: ref.read(selectedDateProvider),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != ref.read(selectedDateProvider)) {
      ref.read(selectedDateProvider.notifier).state = picked;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(ViewExpenseProvide);
    final title = ref.watch(titleProvider);
    final amount = ref.watch(amountProvider);
    final selectedDate = ref.watch(selectedDateProvider);

    // Determine if the current theme is dark mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.darkAppBar : AppColors.lightAppBar,
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: isDarkMode ? AppColors.darkAppBar : AppColors.lightAppBar,

      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        
        child: ListView(
          children: [
            
            Text(
              "Add New Expense",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                color: isDarkMode ? AppColors.darkButtonIcon : AppColors.darkButton,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Title",
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      fontSize: 23,
                      color: isDarkMode ? AppColors.lightAppBar : AppColors.darkButton,
                    ),
                    onChanged: (value) {
                      ref.read(titleProvider.notifier).state = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Amount",
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      fontSize: 23,
                      color: isDarkMode ? AppColors.lightAppBar : AppColors.darkButton,
                    ),
                    onChanged: (value) {
                      try {
                        ref.read(amountProvider.notifier).state = double.parse(value);
                      } catch (e) {
                        // Handle parse error
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: TextButton(
                onPressed: () {
                  _selectDate(context, ref);
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.date_range,
                        size: 30,
                        color: isDarkMode ? AppColors.lightAppBar : AppColors.darkButton,
                      ),
                      padding: EdgeInsets.all(12.0),
                    ),
                    Text(
                      "${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year}",
                      style: TextStyle(
                        fontSize: 20,
                        color: isDarkMode ? AppColors.lightAppBar : AppColors.darkButton,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                print(title);
                if (title != null && amount != null) {
                  model.write(title, amount, selectedDate);
                  ref.read(titleProvider.notifier).state = null;
                  ref.read(amountProvider.notifier).state = null;
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Not all values are completed"),
                      backgroundColor: isDarkMode ? AppColors.lightAppBar : AppColors.darkButton,
                    ),
                  );
                }
              },
              child: Text(
                "Add",
                style: TextStyle(
                  color: isDarkMode ? AppColors.darkButtonIcon : AppColors.lightButtonIcon,
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? AppColors.darkButton : AppColors.lightButton,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: isDarkMode ? AppColors.darkButtonIcon : AppColors.lightButtonIcon,
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? AppColors.darkButton : AppColors.lightButton,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
