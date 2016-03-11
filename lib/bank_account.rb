class BankAccount
  # code here
  attr_reader :name, :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amount)
        @balance += amount
    end

    # def balance
    #     @balance
    # end

    def balance=(balance)
        @balance = balance
    end

    def display_balance
        return "Your Balance is $#{@balance}."
    end

    def status=(status)
      @status = status
    end

    def valid?
        @balance > 0 and @status == "open"
    end

    def close_account
        @status = "closed"
    end
end