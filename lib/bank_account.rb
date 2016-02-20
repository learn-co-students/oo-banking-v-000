class BankAccount
  attr_accessor :status, :balance
  attr_reader :name
  @@all_accounts = []

  def self.all
    @@all_accounts
  end


  def initialize(name)
    self.class.all << self
    @name = name
    self.balance = 1000
    self.status = "open"

  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && self.status == "open" ? true : false
  end

  def close_account
    self.status = "closed"
  end



end
