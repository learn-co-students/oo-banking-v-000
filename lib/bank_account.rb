require 'pry'

class BankAccount

  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(amount)   #it should deposit money into the account
    #binding.pry
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    #binding.pry
    @broke = BankAccount.new(name, balance, status)

    if @broke.balance > 0 && @broke.status != "closed"
      true
     else
      false
    end
  end

  def close_account
    #binding.pry
    @status = "closed"
  end
    

end
