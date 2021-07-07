class BankAccount

  attr_accessor :bank_account, :balance, :status, :transfer
  attr_reader :name
  def initialize(name, bank_account = nil)
    @name = name
    @bank_account = bank_account
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def withdraw(amount)
    @balance = @balance - amount
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end

end
