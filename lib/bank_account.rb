class BankAccount
  # code here
  attr_accessor :account, :balance, :status
  attr_reader :name

  def initialize(name)
    @account = account
    @name = name
    self.balance = 1000
    self.status = "open"
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    if self.status == "open" && self.balance > 0
      return true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end
end
