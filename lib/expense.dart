class Expense {
  int id;
  double amount;
  String description;
  String dueDate;

  Expense(this.id, this.amount, this.description, this.dueDate);

  double get getAmount => this.amount;
  String get getDescription => this.description;
  String get getDueDate => this.dueDate;
  int get getId => this.id;
  int get getNextId => this.id + 1;

  set setAmount(double amount) {
    this.amount = amount;
  }

  set setDescription(String description) {
    this.description = description;
  }

  set setDueDate(String dueDate) {
    this.dueDate = dueDate;
  }

  @override
  String toString() {
    return """
      EXPENSE ID: ${this.id}
      AMOUNT: ${this.amount}
      DESCRIPTION: ${this.description}
      DUE DATE: ${this.dueDate}
    """;

  }
}
