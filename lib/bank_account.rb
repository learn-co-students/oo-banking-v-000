require 'pry'

class BankAccount
  attr_accessor :status, :balance
  attr_reader :name

  ACCOUNTS = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    save
  end

  def deposit(amount)
    #needs to run only if valid? returns true
    @balance += amount
    display_balance
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    ACCOUNTS.include?(self) && (status == "open") && balance > 0
    #this doesn't evaluate the transaction itself
    # #both_valid? iterates, sends one acct at a time here
    #only evaluates each individual account, 
    #called by Transfer.both_valid?
    #will throw false error when called w/just a string, passes current tests

  end

  def close_account
    self.status = "closed"
  end

  def self.all
    ACCOUNTS
  end

  def save
    ACCOUNTS << self
  end

end

