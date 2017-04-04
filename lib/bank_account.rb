class BankAccount
    attr_accessor :status, :balance
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end
    
    def deposit(deposit)
        @balance += deposit
    end
    
    def display_balance
        "Your balance is $#{self.balance}."
    end
    
    def valid?
        @status == "open" && @balance > 0
    end
    
    def close_account
        @status = "closed"
    end
    
end
