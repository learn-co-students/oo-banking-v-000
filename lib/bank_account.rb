require 'pry'

class BankAccount
  attr_accessor :status, :balance
  attr_reader :name

  # BankAccount BankAccount #initialize can initialize a Bank Account
  # BankAccount BankAccount #initialize initializes with a name
  # BankAccount BankAccount #initialize always initializes with balance of 1000
  # BankAccount BankAccount #initialize always initializes with a status of 'open'
  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  # BankAccount #deposit can deposit money into its account
  def deposit(amount)
    @balance += amount
  end

  # BankAccount #display_balance can display its balance
  def display_balance
    "Your balance is $#{@balance}."
  end

  # BankAccount #valid? is valid with an open status and a balance greater than 0
  def valid?
    if @balance > 0 && @status == 'open'
      true
    else
      false
    end
  end

  # BankAccount #close_account can close its account
  def close_account
    @status = 'closed'
  end
end
