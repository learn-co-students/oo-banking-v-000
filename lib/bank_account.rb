class BankAccount
  # code here
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name=name
    @balance=1000
    @status="open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your Balance is $#{@balance}."
  end

  def valid?
   @balance == 0 || @status != "open" ? false : true
  end

  def close_account
    @status="closed"
  end

end
