require 'pry'
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name #initialize can't change its name
  #initializes with a name,balance and status
  def initialize(name)
    @name = name #expect(avi).to be_a(BankAccount)
    @balance = 1000
    @status = "open"
    @account_total = []
  end

  def deposit(amount)
    # can deposit money into its account
    #   expect(avi.balance).to eq(1000)
    #   avi.deposit(1000)
    #   expect(avi.balance).to eq(2000)
     @balance += amount
  end

  def display_balance
    #can display its balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    #is valid with an open status and a balance greater than 0
    self.status == "open" && self.balance > 0 ? true : false
  end

  def close_account
    self.status = "closed"
  end
end
