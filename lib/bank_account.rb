class BankAccount
  attr_accessor :bank_account, :status, :balance
  attr_reader :name

  def initialize(name)
    @balance = 1000
    @bank_account = bank_account
    @name = name
    @status = "open"
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    balance > 0 && status == "open"
  end

  def close_account
    self.status = "closed"
  end



end
