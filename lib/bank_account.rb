class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @balance = 1000
    @status = "open"
    @name = name
  end

  def balance
    @balance
  end

  def status
    @status
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    @balance > 0 && @status == "open"
  end

  def close_account
    @status = "closed"
  end

end
