require 'pry'
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0 ? true : false
  end

  def close_account
    self.status = "closed"
  end
end



#James said 2 mins ago
#cause i havent written anything that can say no to someone trying to send more than they have

#James said a minute ago
#so yea, they are both valid.. cause my valid code only asks me to check that they are open accounts with more than 0 dollars
