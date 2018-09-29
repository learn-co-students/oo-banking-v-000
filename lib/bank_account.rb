class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = balance
    @balance = 1000
    self.status = "open"
  end

  def deposit(amount)
    self.balance = @balance + amount
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status == "open" && self.balance > 0
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end

end
