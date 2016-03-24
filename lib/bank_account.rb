class BankAccount
  # code here
  attr_accessor :balance, :status
  attr_reader :name
  def initialize(name, balance=1000)
    @name=name
    @balance = balance
    @status = "open"
  end
  def deposit(deposit)
    @balance += deposit
    @balance
  end
  def display_balance
    "Your Balance is $#{@balance}."
  end
  def valid?
    @status == "open" && @balance > 0
  end
  def close_account
    @status = "closed"
  end
end
