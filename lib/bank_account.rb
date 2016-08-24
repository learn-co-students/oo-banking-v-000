class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name,status="open")
        @name = name
        @balance = 1000
        @status = status
    end

    def deposit(amount)
        @balance += amount
        @balance
    end

    def display_balance
        "Your balance is $#{balance}."
    end

    def valid?
        if balance > 0 && status != "closed"
            true
        else
            false
        end
    end

    def close_account
        @status = "closed"
        @status
    end



end
