import 'package:flutter/material.dart';
import 'package:flutter_expense/Providers/expense_box_provider.dart';
import 'package:flutter_expense/Providers/expense_provider.dart';
import 'package:flutter_expense/Providers/totalBalanceProvider.dart';
import 'package:flutter_expense/model/expense.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ViewExpenseProvide =
    ChangeNotifierProvider.autoDispose((ref) => ViewExpense(ref));

class ViewExpense extends ChangeNotifier {
  final Ref _ref;

  ViewExpense(this._ref);

  Expense expense = Expense();

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  void init(Expense expense) {
    this.expense = expense;
  }

  Future<void> write(String title, double amount, DateTime date) async {
    loading = true;
    try {
      final box = await _ref.read(expenseBoxProvider.future);
      Expense expense = Expense(title: title, amount: amount, date: date);
      box.add(expense);
      print(expense.id);
      _ref.refresh(expenseProvider);
      _ref.refresh(totalBalanceProvider);
    } catch (e) {
      loading = false;
      return Future.error(e);
    }

    loading = false;
  }

  Future<void> deleteExpense(String id) async {
    final box = await _ref.read(expenseBoxProvider.future);

    // Find the key for the expense with the given id
    final expenseKey = box.keys.firstWhere((key) {
      final expense = box.get(key) as Expense;
      return expense.id == id;
    }, orElse: () => null);

    // If the expense with the given id is found, delete it
    if (expenseKey != null) {
      await box.delete(expenseKey);
      print('Deleted expense with id: $id');
    } else {
      print('Expense with id: $id not found');
    }
    print(id);
    _ref.refresh(expenseProvider);
    _ref.refresh(totalBalanceProvider);
  }
}
