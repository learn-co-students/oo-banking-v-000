# BankAccount
#   #initialize
#     can initialize a Bank Account
#     initializes with a name
#     always initializes with balance of 1000
#     always initializes with a status of 'open'
#     can't change its name
#   #deposit
#     can deposit money into its account
#   #display_balance
#     "Your balance is $1000."
#     can display its balance
#   #valid?
#     is valid with an open status and a balance greater than 0
#   #close_account
#     can close its account


require 'pry'

class BankAccount
  attr_accessor :account, :balance, :status
  attr_reader :name, :deposit, :display_balance, :valid

  def initialize(account)
    @account = account
    @name = account
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    @balance = @balance + money
  end

  def display_balance
    p "Your balance is $#{self.balance}."
  end

  def valid?
    #binding.pry
    if self.status == "open" && self.balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    self.status = "closed"
  end
#
#
#
#
end
