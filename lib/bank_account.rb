class BankAccount
  @@all = []

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?

    if @balance > 0 && @status == "open"
      return true
    else
      return false
    end

  end

  def close_account
    @status = "closed"
  end

  def self.find_by_name(name)
    puts @@all.detect{|account| account.name == name}

  end
end
