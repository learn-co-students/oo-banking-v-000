class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  @@all = []

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
    @@all << self
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    status == "open" && balance > 0
  end

  def close_account
    self.status = "closed"
  end

  def self.all
    @@all
  end

end
