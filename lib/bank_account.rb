class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def close_account
    @status = 'closed'
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def deposit(amount)
    @balance += amount
  end

  def valid?
    @balance>0 && @status=='open'
  end

end
