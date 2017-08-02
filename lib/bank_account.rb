class BankAccount
  attr_reader :name
  attr_accessor :balance, :status, :BankAccount

  def initialize(name)
    @BankAccount = BankAccount
    @balance = 1000
    @name = name
    @status = "open"
  end

  def name
    @name
  end

  def deposit(amount)
    @balance = balance + 1000
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end
end
