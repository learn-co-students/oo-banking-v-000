class BankAccount
  attr_reader :name
  attr_accessor :balance, :deposit_amount, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status == "open" and self.balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    self.status = "closed"
  end
end
