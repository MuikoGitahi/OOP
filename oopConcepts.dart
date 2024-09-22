// Abstract class representing an Expense
abstract class Expense {
  String description;
  double amount;

  Expense(this.description, this.amount);

  // Abstract method to display expense details
  void displayDetails();
}

// Encapsulation: Class for managing a user's expenses
class ExpenseTracker {
  List<Expense> _expenses = [];  // Private list of expenses

  // Method to add an expense
  void addExpense(Expense expense) {
    _expenses.add(expense);
    print("Added Expense: ${expense.description} = \$${expense.amount}");
  }

  // Method to display all expenses
  void showExpenses() {
    print("Expenses:");
    for (var expense in _expenses) {
      expense.displayDetails();
    }
  }
}

// Inheritance: Class for regular expenses
class RegularExpense extends Expense {
  RegularExpense(String description, double amount) : super(description, amount);

  @override
  void displayDetails() {
    print("Regular Expense: $description = \$${amount}");
  }
}

// Inheritance: Class for recurring expenses
class RecurringExpense extends Expense {
  int frequency; // Frequency in days

  RecurringExpense(String description, double amount, this.frequency) 
      : super(description, amount);

  @override
  void displayDetails() {
    print("Recurring Expense: $description = \$${amount} (every $frequency days)");
  }
}

// Main function to demonstrate the expense tracker
void main() {
  // Create an ExpenseTracker instance
  var tracker = ExpenseTracker();

  // Create various expenses
  var rent = RegularExpense("Rent", 150);
  var subscription = RecurringExpense("Monthly Subscription", 20, 30);
  var groceries = RegularExpense("Groceries", 100);

  // Add expenses to the tracker
  tracker.addExpense(rent);
  tracker.addExpense(subscription);
  tracker.addExpense(groceries);

  // Show all expenses
  tracker.showExpenses();
}
