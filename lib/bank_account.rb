


class BankAccount
    attr_accessor :status, :balance
    attr_reader :name
    
    def initialize(name)
        @name = name
        @status = "open"
        @balance = 1000
    end 
    
    def deposit(money)
        @balance = money + @balance
    end
    
    def display_balance
        "Your balance is $#{balance}."
    end 
    
    def valid?
        balance > 0 && status == "open" ? true : false
    end
    
    def close_account
        self.status = "closed"
    end 

end
