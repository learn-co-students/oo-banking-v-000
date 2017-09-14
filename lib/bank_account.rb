class BankAccount
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name.dup.freeze
  end

  def balance
    @balance
  end

  def status
    @status.dup.freeze
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?(amount = 0)
    self.balance > amount && self.status == "open"
  end

  def close_account
    self.status = "closed"
  end
end
