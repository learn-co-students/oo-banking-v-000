require 'pry'

class BankAccount
attr_accessor :accountt, :balance, :status, :debit
attr_reader :name

  def initialize(name)
    @name = name
    @acct = ""
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance = (balance + amount)
    @balance
  end

  def debit(amount)
    @balance = (balance - amount)
    @balance
  end

  def display_balance
    "Your Balance is $#{balance}."
  end

  def valid?
    status == "open" && balance > 0
  end

  def close_account
    @status = "closed"
  end
end