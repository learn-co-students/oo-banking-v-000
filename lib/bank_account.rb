class BankAccount
  attr_accessor :balance, :status
  attr_reader :name #can't change its name

  def initialize(name)
    @name = name #initializes with a name
    @status = "open" #an instance of the BankAccount class always intiailizes with a status of open
    @balance = 1000 #always initializes with balance of 1000
  end 

  #can deposit money into its account
  def deposit(amount)
    self.balance += amount 
  end

  #can display its balance
  def display_balance 
    "Your balance is $#{self.balance}." 
  end

  #is valid with an open status and a balance greater than 0
  def valid?
    if self.status == "open" && self.balance > 0
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end

end
