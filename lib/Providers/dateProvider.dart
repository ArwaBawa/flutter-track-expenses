import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final titleProvider = StateProvider<String?>((ref) => null);
final amountProvider = StateProvider<double?>((ref) => null);