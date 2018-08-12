class BankAccount
  attr_accessor :status, :balance
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(amount)
    @balance+= amount
    @balance
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?(account="")
    self.balance <= 0 || self.status =='closed' ? false : true
  end

  def close_account
    self.status = 'closed'
  end



end
