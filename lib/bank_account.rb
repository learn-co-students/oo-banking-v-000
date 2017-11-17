class BankAccount
  attr_accessor :account, :balance, :status
  attr_reader :name

  def initialize(name)
    @account = account
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit)
    @balance += deposit
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    if @balance > 0 && @status == "open"
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end
end
