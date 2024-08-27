import 'package:flutter/material.dart';
import 'package:flutter_expense/theme/text_styles.dart'; 
class ExpenseListTile extends StatelessWidget {
  final String title;
  final String trailing;

  const ExpenseListTile({
    super.key,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: AppTextStyles.subtitle.copyWith(),
        ),
        trailing: Text(
          trailing,
          style: AppTextStyles.body.copyWith(),
        ),
      ),
    );
  }
}
