class BankAccount

  attr_accessor :status, :balance
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def balance
    @balance
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    p "Your balance is $#{@balance}."
  end

  def valid?
    balance > 0 && status == "open"
  end

  def close_account
    @balance = 0
    @status = "closed"
  end

end
