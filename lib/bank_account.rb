class BankAccount

  attr_accessor :balance, :status
  attr_reader :name
  @@accounts = []

    def initialize (name)
      @name = name
      @balance = 1000
      @status = "open"
      self.save
    end

    def deposit (amount)
      if(amount > 0)
        @balance += amount
      else
        "Invalid Amount"
      end
    end

    def display_balance
      "Your balance is $#{@balance}."
    end

    def valid?
      @balance > 0 && @status == "open"
    end

    def close_account
      @status = "closed"
    end

    def save
      @@accounts << self
      self
    end

    def self.all_accounts
      @@accounts
    end


end
