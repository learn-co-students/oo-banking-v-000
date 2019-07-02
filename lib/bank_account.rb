class BankAccount

  attr_accessor :balance, :status;
  attr_reader :name;

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    self.balance += money
  end

  def display_balance
    "Your current balance is #{@balance}."
  end

  def valid?
  end

  def close_account
    @status = "closed"
  end

end
