require 'pry'
class BankAccount
  attr_accessor :balance, :status , :amount
  attr_reader :name

  def initialize(name)
    @name = name
    @BankAccount= []
    @balance = 1000
    @status = "open"
    @amount = amount
  end

  def name
    @name.dup.freeze
  end

  def deposit(amount)
    #binding.pry
    @balance += amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      return true
    else
      return false
    end
  end

  def close_account
     #@status.chomp!("open") << "closed"
     self.status = "closed"
  end

end
