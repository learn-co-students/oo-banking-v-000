class BankAccount
  attr_accessor :bank_account, :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit)
    #binding.pry
    @balance += deposit
    @balance
  end

  def display_balance
    "Your balance is $#{deposit(balance)}."
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
