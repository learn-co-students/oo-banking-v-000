#update in class curriculm is showing I did not do this and I did.  Trying to resubmit

class BankAccount
  attr_accessor :bank_account, :balance, :status
  attr_reader :name

  def initialize(name,balance = 1000,status = "open")
    @bank_account = bank_account
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(deposit_amt)
    @balance = balance + deposit_amt
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
