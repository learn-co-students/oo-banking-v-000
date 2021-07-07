class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amt)
        @balance += amt
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        0 < @balance && "open" == @status
    end

    def close_account
        @status = "closed"
    end
end
