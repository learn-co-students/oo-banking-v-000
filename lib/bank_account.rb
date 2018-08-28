class BankAccount
  attr_accessor :balance , :status
  attr_reader :name
  
  def initialize(name)
    @name=name 
    @balance=1000
    @status='open'
  end 
  def deposit(amount)
    self.balance+=amount
  end 
  def display_balance
    return "Your balance is $#{@balance}."
  end 
  def valid?
     (self.balance==0 or self.status=='closed') ? FALSE : TRUE 
  end 
  def close_account
    self.status='closed'
  end
end