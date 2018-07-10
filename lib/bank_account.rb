class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

    def initialize(name, balance = 1000, status = "open")
      @name = name
      @balance = balance
      @status = status
    end
  def deposit(name)
    @balance += balance
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if self.status.include?("closed") || self.balance <=0
      false
    else
      true
    end
    
  end

  def close_account
    self.status = "closed"
  end
end
