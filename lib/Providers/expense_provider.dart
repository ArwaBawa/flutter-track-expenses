import 'package:flutter_expense/Providers/expense_box_provider.dart';
import 'package:flutter_expense/model/expense.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final expenseProvider = FutureProvider<List<Expense>>((ref) async {
  final box = await ref.watch(expenseBoxProvider.future);
  return box.values.toList();
});


