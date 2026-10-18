import 'dart:io';

void main(){
  print("Welcome to the Budgest Management Interface");

  List<Map<String, dynamic>> ListIncome = [];
  List<Map<String, dynamic>> ListExpense = [];

  while(true) {
    print("\n Menu");
    print("1. Add Income");
    print("2. Add Expense");
    print("3. View Summary");
    print("4. Exit");
    stdout.write("Choose an option from 1-4");

    String? userInput = stdin.readLineSync();

    if (userInput == null || userInput.isEmpty){
      print("Please Enter a Valid number 1-4");
      continue;
    }
    if (userInput == '1') {
    } else if (userInput == '1') {

    } else if (userInput == '3') {

    } else if (userInput == '4') {
      print("Exiting...");
      break;
    } else {
      print("Error. Please Enter a Number from 1-4");
    }

    double? getValueAmount(String prompt){
      stdout.write(prompt);
      String? Input = stdin.readLineSync();
      double? Amount = double.tryParse(Input ?? '');

      if (Amount == null || Amount <= 0){
        print("Please Enter a valid, positive number amount");
        return null;
      } return Amount;
    }

    if (userInput == '1') {
      stdout.write("Enter Income description");
      String? description = stdin.readLineSync();

      double? Amount = getValueAmount("Enter Income Amount: \$");

      if (Amount != null && description != null && description.isNotEmpty) {
        ListIncome.add({'description': description, 'amount': Amount});
        print("Income Added");
      } else {
        print("Description Can't be Empty");
      }
    } else if (userInput == '2') {
      stdout.write("Enter Expense description");
      String? description = stdin.readLineSync();

      double? Amount = getValueAmount("Enter Expense Amount: \$");

      if (Amount != null && description != null && description.isNotEmpty) {
        ListIncome.add({'description': description, 'amount': Amount});
        print("Expense Added");
      } else {
        print("Description Can't Be Empty");
      }
    } else if (userInput == '3');

    double IncomeTotal = 0.0;

    for(var Income in ListIncome) {
      IncomeTotal += Income['amount'] as double;
    }
    
    double totalExpenses = 0.0;
    for (var Expense in ListExpense) {
      totalExpenses += Expense['amount'] as double;
    }

    double netProfit = IncomeTotal - totalExpenses;

    print("Summary");
    print("Total Income: ${IncomeTotal.toStringAsFixed(2)}");
    print("Total Expenses: ${totalExpenses.toStringAsFixed(2)}");
    print("------");

    String status = netProfit >= 0 ? "Profit" : "Loss";
    print(" $status \$${netProfit.toStringAsFixed(2)}");

    const double Tax = 0.15;

    double taxAmount = netProfit > 0 ? netProfit * Tax : 0.0;

    if (taxAmount > 0) {
      print("15% Tax owed \$${taxAmount.toStringAsFixed(2)}");
    }
  }
}