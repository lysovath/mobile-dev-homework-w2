class BankAccount {
    // TODO
    final int _accountId;
    final String _name;
    double _balance = 0;

    BankAccount(this._accountId, this._name);

    
    int get accountId => this._accountId;

    String get name => this._name;
    
    double get balance => this._balance;

    
    void withdraw(double amount){
      if(amount > this._balance){
        throw Exception("Insufficient balance for withdrawal");
      }
      this._balance -= amount;
    }

    void credit(double amount){
      this._balance += amount;
    }

}

class Bank {
    // TODO
    List<BankAccount> _accounts = [];
    String _name;

    Bank({required String this._name});


    BankAccount createAccount(int accountId, String accountOwner){
      for(BankAccount account in this._accounts){
        if(account.accountId == accountId){
          throw Exception("Account with ID ${accountId} already exist");
        }
      }
      BankAccount newAccount = BankAccount(accountId, accountOwner);
      this._accounts.add(newAccount);
      return newAccount;
    }
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
