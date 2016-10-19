class BankAccount

  attr_accessor :balance, :open, :status
  attr_reader :name

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(amount)
    @balance = balance + amount
  end

  def debit(amount)
    @balance = balance - amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    if (status == "open") && (balance > 0)
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end
end
