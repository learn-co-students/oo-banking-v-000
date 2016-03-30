class BankAccount
  attr_accessor :bank_account, :balance, :status

  attr_reader :name

  def initialize(name)
    @name=name
    @balance=1000
    @status="open"
  end

  def deposit(money)
    self.balance+=money
  end

  def display_balance
    "Your Balance is $#{balance}."
  end

  def valid?
    self.balance>0 && self.status=="open"
  end

  def close_account
    self.status="closed"
  end
end