#####initialize
#can initialize a Bank Account
#initializes with a name
#always initializes with balance of 1000
#always initializes with a status of 'open'
#can't change its name
#####deposit
#can deposit money into its account
#####display_balance
#can display its balance                                                                                                            
#####valid?
#is valid with an open status and a balance greater than 0
#####close_account
#can close its account

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name


  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit)
    self.balance += deposit
  end

  def display_balance()
    "Your balance is $#{balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    self.status = "closed"
  end
end
