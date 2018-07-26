class BankAccount

  attr_accessor :balance, :status, :array
  attr_reader :name

  def initialize(name)
    @balance = 1000
    @status = "open"
    @name = name
  end

  def deposit(amount)
    @balance += amount
    @balance
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end
end
