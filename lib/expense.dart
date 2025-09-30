class Expense {
  int _id;
  double _amount;
  String _description;
  String _dueDate;

  Expense(int id, double amount, String description, String dueDate)
    : this._id = id,
      this._amount = amount,
      this._description = description,
      this._dueDate = dueDate;

  double get amount => this._amount;
  String get description => this._description;
  String get dueDate => this._dueDate;
  int get id => this._id;
  int get nextId => this._id + 1;

  set amount(double amount) {
    this._amount = amount;
  }

  set description(String description) {
    this._description = description;
  }

  set dueDate(String dueDate) {
    this._dueDate = dueDate;
  }

  @override
  String toString() {
    return """
      EXPENSE ID: ${this._id}
      AMOUNT: ${this._amount}
      DESCRIPTION: ${this._description}
      DUE DATE: ${this._dueDate}\n
    """;

  }

  Map<String, dynamic> toJson() {
    return {
      "id": this._id,
      "amount": this._amount,
      "description": this._description,
      "dueDate": this._dueDate
    };
  }
}
