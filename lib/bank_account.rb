require 'pry'
class BankAccount

attr_accessor :balance, :status

attr_reader :name

    def initialize(name)
      @name = name
      @balance = 1000
      @status = "open"
    end

    def deposit(money)
    self.balance = money + @balance
    end

    def display_balance
    return "Your Balance is $#{self.balance}."
    end

    def valid?
    if self.balance > 0 && self.status == "open"
    true
    else
    false
    end  
    end

    def close_account
    self.status = "closed"  
    end


end


#bank account class can transfer money to another class through transfer class. 
#Transfer class acts as a spacefor a transaction between 2 instances of bank acc
#you cant just transfer $ without the bank running checks.
#Transfer will check validity of the accounts then run the transaction. 
#Transaction instances should reject if accounts arent valid or if no money
#start "pending", change to "complete" or "rejected"
#completed can be reversed to a "reversed" status. 