class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

    def initialize(name="BobBarker")
      @name =name
      @balance = 1000
      @status = "open"
    end

    def deposit(amount)
      @balance = @balance + amount
    end

    def display_balance
      "Your Balance is $#{@balance}."
    end

    def valid?
      if @balance > 0 && @status == "open"
        true
      else
        false
      end
    end

    def close_account
      @status = "closed"
    end

end
