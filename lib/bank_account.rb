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
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == 'open' && self.balance > 0
  # refactored 23 - 27 to one line on 21
  #  if self.status == 'open' && self.balance > 0
  #    true
  #  else
  #    false
  #  end
  end

  def close_account
    self.status = 'closed'
  end
end
