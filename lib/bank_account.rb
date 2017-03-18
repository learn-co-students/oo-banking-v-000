class BankAccount

  attr_accessor :balance, :name, :status

  def initialize(name)
    @balance = 1000
    @status = "open"
    @name = name
  end

  def name=(name)
   raise "Name can't be changed."
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
     @status == "open" && @balance > 0
  end

  def close_account
    self.status = "closed"
  end


end
