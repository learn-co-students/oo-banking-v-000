class BankAccount

  attr_reader :name
  attr_accessor :status, :balance

  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end

  def deposit(deposit)
    @balance += deposit
    @balance
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    self.status = "closed"
  end
end
