class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    save
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if (@balance > 0) and (@status == "open")
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

end
