class BankAccount
  
  attr_accessor :bank_account, :balance, :status
  attr_reader :name

  def initialize(name)
    @bank_account = bank_account
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    balance > 0 && status == "open" ? true : false
  end

  def close_account
    self.status = "closed"
  end
end