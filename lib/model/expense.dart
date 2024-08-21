import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 1)
class Expense extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
   double amount;
   @HiveField(2)
   DateTime date;

  Expense({ this.title='' ,  this.amount=0.0 ,DateTime? date,}): date = date ?? DateTime.now();
}