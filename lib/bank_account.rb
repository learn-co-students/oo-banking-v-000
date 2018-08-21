require 'pry'

class BankAccount

    attr_accessor :balance, :status
     attr_reader :name
    
    def  initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(deposit_amount)
        self.balance += deposit_amount
        #or self.balance = self.balance + deposit_amount
    end

    def display_balance
      p  "Your balance is $#{balance}."
    end

    def valid?
        balance > 0 && status == "open"
    end

    def close_account
        self.status = "closed"
    end
end
