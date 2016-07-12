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
    return "Your balance is $#{@balance}."
  end

  def valid?
    (@balance > 0) && status == "open" ? true : false
  end

  def close_account
    self.status = "closed"
  end

end
