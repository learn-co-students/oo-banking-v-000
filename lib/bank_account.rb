class BankAccount
attr_accessor :balance, :status


   def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
  end

   def name
    @name
  end

  def deposit(money) 
    @money = money
    @balance += @money
  end

  def display_balance
   "Your Balance is $#{@balance}."
  end

  def valid?
     @status == "open" && @balance > 0 ? true : false
  end

  def close_account
    @status = "closed"
  end

end