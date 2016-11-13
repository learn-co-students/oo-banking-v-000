class BankAccount

  attr_accessor :status, :balance
  attr_reader :name

  def initialize(name)
    @name = name
    self.balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw_or_transfer(amount)
    @balance = @balance - amount
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end

end
