class BankAccount

  attr_accessor :balance, :status
  @name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name
  end

  def deposit(ammount)
    @balance +=  ammount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?(balance = 0)
    return true if (@balance > balance && @status == "open")
    false
  end

  def close_account
    @status = "closed"
  end

end
