class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(money)
    @balance = self.balance + money
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if status != 'open' || balance < 1
      then false
    else
      true
    end
  end

  def close_account
    self.status = 'closed'
  end
end
