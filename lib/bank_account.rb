class BankAccount
  attr_accessor :status, :balance
  attr_reader  :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    validity = nil
    (self.status == 'open' && self.balance > 0) ? validity = true : validity = false
    validity
  end

  def close_account
    self.status = 'closed'
  end
end
