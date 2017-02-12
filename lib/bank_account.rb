class BankAccount

  attr_accessor :bank_account, :balance, :status
  attr_reader :name

  def initialize(name)
    # @bank_account = bank_account
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    self.balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.status == "open" && @balance > 0
  end

  def close_account
    self.status = "closed"
  end
end
