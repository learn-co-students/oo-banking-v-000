class BankAccount
  attr_reader :name, :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @balance > 0 && @status == "open"
  end

  def balance=(amount)
    @balance = amount
  end

  def status=(status)
    @status = status
  end

  def close_account
    @status = "closed"
  end

end
