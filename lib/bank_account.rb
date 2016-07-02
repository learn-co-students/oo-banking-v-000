class BankAccount
  attr_accessor :client, :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    if amount < @balance
      @balance -= amount
    else
      nil
    end
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    (@status == "open" && @balance > 0)
  end

  def close_account
    @status = "closed"
    @balance = 0
  end


end