class BankAccount
attr_accessor :balance, :status, :transfer
attr_reader :name
@@all = []

  def initialize(account_name)
    @name = account_name
    @@all<<self
    @balance = 1000
    @status = "open"
    @transfer = []
  end

  def self.all
    @@all
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def valid?
    @status=="open" && @balance>0
  end

  def close_account
    @status = "closed"
  end

end
