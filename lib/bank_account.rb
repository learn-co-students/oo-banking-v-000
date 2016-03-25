class BankAccount
attr_accessor :balance, :status
attr_reader :name
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  # code here
  def display_balance
   "Your Balance is $#{@balance}."
  end

  def deposit(cash)
    @balance += cash
  end

  def valid?
    @balance != 0 && @status == "open"
  end

  def close_account
    @status = "closed"
  end
end