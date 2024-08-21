import 'package:flutter_expense/model/expense.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final expenseBoxProvider = FutureProvider<Box<Expense>>(
  (ref) => Hive.openBox<Expense>("expense"),  
);