import 'package:flutter/material.dart';
import 'package:flutter_expense/Providers/view_expense%7C_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseController {
  void openDeleteBox(BuildContext context, WidgetRef ref, String id) {
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
                await ref.read(ViewExpenseProvide.notifier).deleteExpense(id);
                print(id);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
