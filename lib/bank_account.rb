class BankAccount
  attr_accessor :balance, :status, :name

  def initialize(name)
    @balance = 1000
    @status = "open"
    @name = name
  end

  def name=(name)
    raise ArgumentError.new("Can't change the name of a bank account!")
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @balance > 0 && @status == "open" ? true : false
  end

  def close_account
    @balance = 0
    @status = "closed"
  end

end
