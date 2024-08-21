import 'package:flutter/material.dart';
import 'package:flutter_expense/theme/color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final String trailing;

  final void Function(BuildContext)? onDeletePress;

  const MyListTile({
    super.key,
    required this.title,
    required this.trailing,
    this.onDeletePress,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: onDeletePress,
            backgroundColor: isDarkMode ? AppColors.darkButton : AppColors.lightButton,
            foregroundColor: AppColors.darkButtonIcon,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
      child: Card(
        color: isDarkMode ? AppColors.darkButtonIcon : AppColors.lightButtonIcon,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: isDarkMode ? AppColors.darkText : AppColors.darkAppBar,
              fontSize: 20,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Text(
            trailing,
            style: TextStyle(
              color: isDarkMode ? AppColors.darkText : AppColors.darkButton,
              fontSize: 14,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }
}
