import 'package:flutter/material.dart';
import 'package:flutter_expense/Providers/themeProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_expense/Providers/expense_provider.dart';
import 'package:flutter_expense/Providers/totalBalanceProvider.dart';
import 'package:flutter_expense/controllers/expense_controller.dart';
import 'package:flutter_expense/pages/Add_expense.dart';
import 'package:flutter_expense/widget/ExpenseListTile.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalBalance = ref.watch(totalBalanceProvider);
    final ExpenseController expenseController = ExpenseController();
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpense()),
          ).whenComplete(() {
            ref.refresh(expenseProvider);
          });
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).floatingActionButtonTheme.foregroundColor,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Total Expenses: ${totalBalance.value} SAR',
                textAlign: TextAlign.center,
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
            Switch(
              value: themeMode == ThemeMode.dark,
              onChanged: (value) {
                ref.read(themeModeProvider.notifier).state =
                    value ? ThemeMode.dark : ThemeMode.light;
              },
            ),
          ],
        ),
      ),
      body: ref.watch(expenseProvider).when(
            data: (expenses) => ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];
                return Slidable(
                  key: ValueKey(expense.id),
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          expenseController.openDeleteBox(
                              context, ref, expense.id);
                        },
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor:
                            Theme.of(context).textTheme.labelLarge?.color,
                        icon: Icons.delete,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ],
                  ),
                  child: ExpenseListTile(
                    title: expense.title,
                    trailing:
                        '${expense.amount} SAR, ${DateFormat.yMMMd().format(expense.date)}',
                  ),
                );
              },
            ),
            error: (e, s) => Center(
              child: Text(
                e.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
