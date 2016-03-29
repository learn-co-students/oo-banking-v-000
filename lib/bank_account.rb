require 'pry'
class BankAccount

  attr_accessor :bank_account, :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @bank_account = bank_account
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    @balance = money + @balance
  end

  def display_balance
    "Your Balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
    true
  else
    false
  end

end

  def close_account
    @status = "closed"
  end


end