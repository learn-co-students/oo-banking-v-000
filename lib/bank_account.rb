class BankAccount
attr_reader :name
attr_accessor :balance, :status
 def initialize(name)
   @name=name
   @balance=1000
   @status="open"
  end
  def deposit(val)
    @balance+=val
  end
  def display_balance
     "Your balance is $#{@balance}."
  end
  def valid?
  (@balance>0 && @status=="open")


  end
  def close_account
     @status="closed"
  end
end
