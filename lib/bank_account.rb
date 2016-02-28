class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your Balance is $#{@balance}."
  end

  def valid?
    if self.status == "open" && self.balance >= 1000
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end

end