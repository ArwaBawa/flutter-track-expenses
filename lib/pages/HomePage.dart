import 'package:flutter/material.dart';
import 'package:flutter_expense/Providers/expense_provider.dart';
import 'package:flutter_expense/Providers/totalBalanceProvider.dart';
import 'package:flutter_expense/Providers/view_expense%7C_provider.dart';
import 'package:flutter_expense/model/Add_expense.dart';
import 'package:flutter_expense/theme/color.dart';
import 'package:flutter_expense/widget/listTile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(ViewExpenseProvide);
    final totalBalance = ref.watch(totalBalanceProvider);
    final isDarkMode = AdaptiveTheme.of(context).mode.isDark;

    void openDeleteBox(BuildContext context, int expenseKey, WidgetRef ref) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete Expense"),
            content: Text("Are you sure you want to delete this expense?"),
            actions: <Widget>[
              TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Delete"),
                onPressed: () async {
                  model.deleteItem(expenseKey);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.darkAppBar : AppColors.lightAppBar,

      floatingActionButton: FloatingActionButton(
        backgroundColor: isDarkMode
            ? AppColors.darkButton
            : AppColors.lightButton,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Add_expense()),
          ).whenComplete(() {
            ref.refresh(expenseProvider); // Refresh data when returning
          });
        },
        child: Icon(
          Icons.add,
          color: isDarkMode ? AppColors.darkButtonIcon : AppColors.lightButtonIcon,
        ),
      ),
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? AppColors.darkAppBar
            : AppColors.lightAppBar,
        title: Text(
          'Total Expenses: ${totalBalance.value} SAR',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            color: isDarkMode ? AppColors.darkButtonIcon : AppColors.darkBackground,
          ),
        ),
      ),
      body: ref.watch(expenseProvider).when(
            data: (expenses) => ListView(
              children: expenses
                  .map((expense) => MyListTile(
                        title: expense.title,
                        trailing: '${expense.amount} SAR, ${DateFormat.yMMMd().format(expense.date)}',
                        onDeletePress: (context) =>
                            openDeleteBox(context, expense.key, ref),
                      ))
                  .toList(),
            ),
            error: (e, s) => Center(
              child: Text(
                e.toString(),
                style: TextStyle(
                  color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                ),
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
