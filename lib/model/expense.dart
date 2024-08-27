import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'expense.g.dart';

final Uuid uuid = Uuid();

@HiveType(typeId: 1)
class Expense extends HiveObject {
  @HiveField(0)
  late final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  double amount;

  @HiveField(3)
  DateTime date;

  // Constructor
  Expense({
    this.title = '', 
    this.amount = 0.0, 
    DateTime? date,
  })  : date = date ?? DateTime.now(),
      id = uuid.v4();
}