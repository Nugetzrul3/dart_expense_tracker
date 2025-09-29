import 'dart:collection';
import 'dart:io';

import 'package:dart_expense_tracker/expense.dart';
import 'package:dart_expense_tracker/utils.dart';

// Store expenses in list on memory
HashMap<int, Expense> expenses = HashMap();

void main() {
  printOptions();
  String? optionChosen;

  while (optionChosen?.trim() != "4") {
    optionChosen = stdin.readLineSync()?.trim();

    switch (optionChosen) {
      case "1":
        addExpense();
      case "2":
        viewExpenses();
      case "3":
        deleteExpense("1");
      case "4":
        print("Bye bye!");
        return;
      default:
        print("Unknown option $optionChosen! Try again");
    }

    printOptions();
  }
}

void addExpense() {
  String? expenseInput;
  print("Enter expense amount: ");
  expenseInput = stdin.readLineSync()?.trim();

  if (expenseInput == null) {
    print("Invalid expense amount!");
    return;
  }

  if (expenseInput.isEmpty) {
    print("Expense cannot be empty!");
    return;
  }

  double? expenseAmount = double.tryParse(expenseInput);

  if (expenseAmount == null) {
    print("Invalid expense amount!");
    return;
  }

  String? descriptionInput;
  print("Enter description: ");
  descriptionInput = stdin.readLineSync()?.trim();

  if (descriptionInput == null) {
    print("Invalid description!");
    return;
  }

  if (descriptionInput.isEmpty) {
    print("Description cannot be empty!");
    return;
  }

  String? dueDateInput;
  print("Enter due date: ");
  dueDateInput = stdin.readLineSync()?.trim();

  if (dueDateInput == null) {
    print("Invalid description!");
    return;
  }

  if (dueDateInput.isEmpty) {
    print("Description cannot be empty!");
    return;
  }

  if (expenses.isNotEmpty) {
    Expense lastExpense = expenses.values.last;
    Expense newExpense = Expense(lastExpense.getNextId, expenseAmount, descriptionInput, dueDateInput);
    expenses[lastExpense.getNextId] = newExpense;
  } else {
    Expense newExpense = Expense(0, expenseAmount, descriptionInput, dueDateInput);
    expenses[0] = newExpense;
  }

}

void deleteExpense(String id) {

}

void viewExpenses() {
  for (final expense in expenses.values) {
    print(expense);
  }
}

void printOptions() {
  String options =
  """
  Welcome to expense tracker! Here are your options:
  1. Add Expense
  2. View Expenses
  3. Delete Expenses
  4. Save Expenses
  5. Exit
  """;
  print(options);
}
