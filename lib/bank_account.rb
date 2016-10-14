class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    self.name = name
    self.balance = 1000
    self.status = "open"
  end

  def deposit(deposit)
    @balance += deposit
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end

  private

  def name=(name)
    @name = name
  end

end
