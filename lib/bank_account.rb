class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    @balance = @balance + money
  end

  def display_balance
      "Your Balance is $#{balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    self.status = "closed"
  end
  # code here
end