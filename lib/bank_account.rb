require 'pry'

class BankAccount

    attr_accessor :balance, :status
    attr_reader :name, :deposit

    def initialize(name) 
        @name = name
        @balance = 1000
        @status = "open"
        raise ImproperChangeError if name != name        
    end

    def deposit(deposit)
        @deposit = deposit
        @balance = balance + deposit
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    def valid?
        if @status == "open" && @balance > 0
            true
        else
            false    
        end
    end

    def close_account
        @status = "closed"
    end

end
