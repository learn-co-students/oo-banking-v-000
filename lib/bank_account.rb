class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if self.balance == 0 || self.status == "closed"
      false
    else
      true
    end
  end

  def close_account
    @status = "closed"
  end
end
