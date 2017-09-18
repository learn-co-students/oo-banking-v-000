require "pry"
class BankAccount
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  attr_accessor :balance, :status
  attr_reader :name

  def deposit(money)
    # binding.pry
    @money = money
    @balance = @balance + money
  end
  def display_balance
    "Your balance is $#{@balance}."
  end
  def valid?
    @status == "open" && @balance > 0
  end
  def close_account
    @status = "closed"

  end


end
