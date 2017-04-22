class BankAccount

#read only name on account(per lab)
  attr_reader :name

#balance and status on an account can change, these need attr_accessor
  attr_accessor :balance, :status

 #can initialize a Bank Account
 #initializes with a name
 #always initializes with balance of 1000
 #always initializes with a status of 'open'
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

#can deposit money into its account
  def deposit(deposit_amount)
    self.balance += deposit_amount
  end


#can display its balance (as a string)
  def display_balance
    "Your balance is $#{@balance}."
  end

#can close its account
  def close_account
  	@status = "closed"
  end

#is valid with an open status and a balance greater than 0
  def valid?
  	#remember '=' makes variable , '==' is equal to!!!
    (@balance > 0) && (@status == "open")
  end

end
