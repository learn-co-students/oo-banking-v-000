class BankAccount
    attr_accessor :status, :balance, :transfer
    attr_reader :name
    
    def initialize(name)
        @name = name
        @status = "open"
        @balance = 1000
        
    end 
    
    def deposit(amount)
        self.balance += amount
    end  
    def display_balance
        "Your balance is $#{self.balance}."
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
