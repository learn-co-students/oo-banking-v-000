class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name, balance=1000, status='open')
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        "Your Balance is $#{balance}."
    end

    def valid?
        @status == 'open' && @balance > 0 ? true : false
    end

    def close_account
        self.status = 'closed'
    end
end
