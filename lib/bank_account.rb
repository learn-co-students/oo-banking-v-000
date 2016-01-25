class BankAccount
  # code here
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(cash)
    @balance += cash
  end

  def display_balance
    return "Your Balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end
end