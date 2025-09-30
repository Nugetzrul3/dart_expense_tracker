import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:dart_expense_tracker/expense.dart';
import 'package:dart_expense_tracker/utils.dart';

// Store expenses in list on memory
HashMap<int, Expense> expenses = HashMap();

void main() {
  printOptions();
  String? optionChosen;

  while (true) {
    optionChosen = stdin.readLineSync()?.trim();

    switch (optionChosen) {
      case "1":
        addExpense();
      case "2":
        viewExpenses();
      case "3":
        deleteExpense();
      case "4":
        updateExpense();
      case "5":
        saveExpenses();
      case "6":
        print("Bye bye!");
        return;
      default:
        print("Unknown option $optionChosen! Try again");
    }

    printOptions();
  }
}

void updateExpense() {
  String? idInput;
  print("Enter ID to update: ");
  idInput = stdin.readLineSync()?.trim();

  if (idInput == null) {
    print("Invalid ID!");
    return;
  }

  if (idInput.isEmpty) {
    print("ID must be entered!");
    return;
  }

  int? id = int.tryParse(idInput);

  if (id == null) {
    print("Invalid ID!");
    return;
  }

  if (!expenses.containsKey(id)) {
    print("ID does not exist!");
    return;
  }

  Expense expense = expenses[id]!;

  print("Update fields. Press enter to keep the field same\n");
  print("Update description [${expense.description}]: ");
  String? updatedDescription;
  updatedDescription = stdin.readLineSync()?.trim();

  if (updatedDescription == null || updatedDescription.isEmpty) {
    updatedDescription = expense.description;
  }

  print("Update amount [${expense.amount}]: ");
  String? updatedAmountInput;
  updatedAmountInput = stdin.readLineSync()?.trim();

  if (updatedAmountInput == null || updatedAmountInput.isEmpty) {
    updatedAmountInput = expense.amount.toString();
  }

  double? updatedAmount = double.tryParse(updatedAmountInput);

  if (updatedAmount == null) {
    print("Invalid amount!");
    return;
  }

  print("Update due date: ");
  String? updatedDueDate;
  updatedDueDate = stdin.readLineSync()?.trim();

  if (updatedDueDate == null || updatedDueDate.isEmpty) {
    updatedDueDate = expense.dueDate;
  }

  expense.amount = updatedAmount;
  expense.description = updatedDescription;
  expense.dueDate = updatedDueDate;

  print("Expense updated!");

}

void saveExpenses() {
  if (expenses.isEmpty) {
    print("No expenses to save!");
    return;
  }

  final File fileSink = File("expenses.json");

  const JsonEncoder jsonEncoder = JsonEncoder.withIndent("  ");
  List<Expense> expensesToWrite = expenses.values.toList();
  final String jsonString = jsonEncoder.convert(expensesToWrite);

  print(jsonString);
  fileSink.writeAsStringSync(jsonString);

  print("Expenses Saved!");

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
    print("Invalid due date!");
    return;
  }

  if (dueDateInput.isEmpty) {
    print("Due date cannot be empty!");
    return;
  }

  if (expenses.isNotEmpty) {
    Expense lastExpense = expenses.values.last;
    Expense newExpense = Expense(lastExpense.nextId, expenseAmount, descriptionInput, dueDateInput);
    expenses[lastExpense.nextId] = newExpense;
  } else {
    Expense newExpense = Expense(0, expenseAmount, descriptionInput, dueDateInput);
    expenses[0] = newExpense;
  }

  print("Expense added!");

}

void deleteExpense() {
  String? idInput;
  print("Enter ID to remove: ");
  idInput = stdin.readLineSync()?.trim();

  if (idInput == null) {
    print("Invalid ID!");
    return;
  }

  if (idInput.isEmpty) {
    print("ID must be entered!");
    return;
  }

  int? id = int.tryParse(idInput);

  if (id == null) {
    print("Invalid ID!");
    return;
  }

  if (!expenses.containsKey(id)) {
    print("ID does not exist!");
    return;
  }

  expenses.remove(id);
  print("Expense removed!");

}

void viewExpenses() {
  if (expenses.isEmpty) {
    print("\n-- NO EXPENSES --\n");
    return;
  }
  for (final expense in expenses.values) {
    print("----------\n");
    print(expense);
    print("----------\n");
  }
}

void printOptions() {
  String options =
  """
  Welcome to expense tracker! Here are your options:
  1. Add Expense
  2. View Expenses
  3. Delete Expense
  4. Update Expense
  5. Save Expenses
  6. Exit
  """;
  print(options);
}
