#require 'pry'
class BankAccount
attr_accessor :balance, :status, :deposit
  def initialize (name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  def name
    @name
  end
  def deposit=(a_deposit)
    @a_deposit = a_deposit
  end
  def deposit(a_deposit)
    #binding.pry
     @balance =
     @balance + a_deposit
     #binding.pry
  end
  def display_balance
  "Your balance is $#{@balance}."
  end
  def valid?
    if @status == "open" &&
      @balance > 0
    true
    else
    false
    end
  end
  def close_account
    @status = "closed"
  end
end
