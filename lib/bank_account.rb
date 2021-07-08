class BankAccount
  @@all = []
  attr_accessor :balance, :status
  attr_reader :name 
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self 
  end 
  
  def self.all
    @@all
  end
  
  def deposit(amount)
    @balance = @balance + amount 
    @balance
  end 
  
  def display_balance 
    bal = "Your balance is $#{@balance}."
    bal
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
