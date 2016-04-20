class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit)
    @balance += deposit
  end

  def display_balance
    "Your Balance is $#{balance}."
  end

  def valid?
    if @balance > 0 && @status == "open"
      return true
    else
      return false
    end
  end

  def close_account
    @status = "closed"
  end
  # code here
end
