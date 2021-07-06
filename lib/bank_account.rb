class BankAccount
  attr_accessor :balance, :status
  
  def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def name 
        @name
    end

    def deposit(amt)
        @balance+=amt
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        if @status=="open"&&@balance>0
            true
        else
            false
        end
    end

    def close_account
        @status="closed" 
    end

end
