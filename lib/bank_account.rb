class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name, balance = 1000, status = "open")
        @name = name
        @balance = balance
        @status = status

    end

    def deposit(amount)
        @balance += amount
    end

    def valid?
        return true if @status == "open" && @balance > 0
    else
        false
    end

    def display_balance
        "Your Balance is $#{@balance}."
    end

    def close_account
        @status = "closed"
    end
  # code here
end
