class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name
  end

  def deposit(amount)
    if amount > 0
      @balance += amount
    end
  end

  def withdraw(amount)
    @balance -= amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status == "open" && self.balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    self.status = "closed"
  end


end
