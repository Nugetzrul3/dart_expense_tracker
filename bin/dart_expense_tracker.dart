import 'dart:io';

void main() {
  printOptions();
  String? optionChosen;

  while (optionChosen?.trim() != "4") {
    optionChosen = stdin.readLineSync();

    switch (optionChosen) {
      case "1":
        addExpense();
      case "2":
        viewExpenses();
      case "3":
        deleteExpense("1");
      default:
        print("Unknown option $optionChosen! Try again");
    }

    printOptions();
  }
}

void addExpense() {

}

void deleteExpense(String id) {

}

void viewExpenses() {

}

void printOptions() {
  String options =
  """
  Welcome to expense tracker! Here are your options:
  1. Add Expense
  2. View Expenses
  3. Delete Expenses
  4. Exit
  """;
  print(options);
}
