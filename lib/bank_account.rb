class BankAccount
  attr_accessor :status, :balance
  attr_reader :name
  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end

  def deposit(capital)
    @balance += capital
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @balance > 0 && @status == "open" ? true : false
  end

 def close_account
   @status = "closed"
 end

end
