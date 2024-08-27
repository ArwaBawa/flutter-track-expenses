import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expense/Providers/dateProvider.dart';
import 'package:flutter_expense/Providers/view_expense%7C_provider.dart';
import 'package:flutter_expense/theme/text_styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddExpense extends ConsumerWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseModel = ref.watch(ViewExpenseProvide);
    final title = ref.watch(titleProvider);
    final amount = ref.watch(amountProvider);
    final selectedDate = ref.watch(datePickerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Text(
              "Add New Expense",
              textAlign: TextAlign.center,
              style: AppTextStyles.header.copyWith(),
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
                    style: AppTextStyles.textField.copyWith(),
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
                    style: AppTextStyles.textField.copyWith(),
                    onChanged: (value) {
                      try {
                        ref.read(amountProvider.notifier).state =
                            double.parse(value);
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
                  ref
                      .read(datePickerNotifierProvider.notifier)
                      .selectDate(context);
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
                      ),
                      padding: EdgeInsets.all(12.0),
                    ),
                    Text(
                      "${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year}",
                      style: AppTextStyles.dateButton.copyWith(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                if (title != null && amount != null) {
                  expenseModel.write(title, amount, selectedDate);
                  ref.read(titleProvider.notifier).state = null;
                  ref.read(amountProvider.notifier).state = null;
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Not all values are completed",
                        style: AppTextStyles.snackBar.copyWith(),
                      ),
                    ),
                  );
                }
              },
              child: Text(
                "Add",
                style: AppTextStyles.button.copyWith(),
              ),
              style: ElevatedButton.styleFrom(
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
                style: AppTextStyles.button.copyWith(),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
