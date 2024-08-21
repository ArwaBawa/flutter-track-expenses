import 'package:flutter_expense/Providers/expense_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final totalBalanceProvider = FutureProvider<double>((ref) async {
  final expenses = await ref.watch(expenseProvider.future);
  double total = 0.0;
  for (var expense in expenses) {
    total += expense.amount;
  }
  return total;
});
