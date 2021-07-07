require 'pry'

class BankAccount

  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name
  end

  def deposit(amount) #can deposit money into its acct
    @balance += amount
  end

  def display_balance #can display its balance
    "Your balance is $#{self.balance}."
  end

  def valid? #is valid w/open status & balance > than 0
     if @status == "open" && @balance > 0
       true
     else
       false
     end
  end

  def close_account
     self.status = "closed"
  end

end
