import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatePickerNotifier extends StateNotifier<DateTime> {
  DatePickerNotifier() : super(DateTime.now());

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: state,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != state) {
      state = picked;
    }
  }
}

final datePickerNotifierProvider =
    StateNotifierProvider<DatePickerNotifier, DateTime>(
  (ref) => DatePickerNotifier(),
);

final titleProvider = StateProvider<String?>((ref) => null);

final amountProvider = StateProvider<double?>((ref) => null);
