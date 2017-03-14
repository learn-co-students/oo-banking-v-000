class BankAccount
  attr_reader :balance, :status, :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount if amount > 0
  end

  def withdrawal(amount)
    @balance -= amount if amount > 0
  end

  def valid?
    self.status == "open" && @balance > 0 ? true : false
  end

  def close_account
    @status = "closed"
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def balance_for_transfer=(balance)
    @balance = balance
  end

end
