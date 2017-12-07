class BankAccount
  attr_accessor :status, :balance, :transfer, :deposit
  attr_reader :name
  @@all =[]

  def initialize(name, status = "open")
    @name = name
    @status = "open"
    @balance = 1000
    @deposit > 0
  end

  def deposit
    deposit > 0
    balance + deposit = deposit
  end

  def display_balance(name)
    "Your balance is $#{name.balance}"
  end

  def valid?(name)
    #@broke = self.new(name)
    #@broke.balance = 0
    #@closed = self.new(name)
    #@closed.status = "closed"
    if status = "open" && balance > 0
      true
    else
      false
    end
  end

  def close_account(name)
    name.status = "closed"
  end

end
