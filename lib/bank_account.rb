class BankAccount
  attr_reader :name 
  attr_accessor :balance, :status


  def initialize(name, balance=1000)
    @name = name
    @balance = balance
    @status = "open"
  end

  def deposit(transfer_amount)
       @balance += transfer_amount
  end


  def display_balance
    "Your Balance is $#{@balance}."
  end

  def valid?
  balance > 0 && status == "open"
  end

  def close_account
   @status = "closed"
  end
  #puts new balance
end