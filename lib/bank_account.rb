class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "closed" || @balance <= 0 ? false : true
  end

  def close_account
    @status == "closed" ? "The account for #{name} is already closed." : @status = "closed"
  end

end
