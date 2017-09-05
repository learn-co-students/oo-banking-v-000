class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name) #initializes with a name
    @name = name
    @balance = 1000 #always initializes with balance of 1000
    @status = 'open' #initializes with a status of 'open'
  end

  def deposit(amount) #can deposit money into its account
    self.balance += amount
  end

  def display_balance #can display its balance
    "Your balance is $#{self.balance}."
  end

  def valid? #is valid with an open status and a balance greater than 0
    self.status == 'open' && self.balance > 0
  end

  def close_account #can close it's account
    self.status = 'closed'
  end
end
