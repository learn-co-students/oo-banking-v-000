class BankAccount
#can't change its name
  attr_reader :name

  attr_accessor :balance, :status

#initializes with a name, always with a balance of 1000, and always with a status of "open"
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

#can deposit money into its account
  def deposit(money)
    self.balance = (self.balance + money)
  end

#can display its balance
  def display_balance
    "Your balance is $#{self.balance}."
  end

#is valid with open status and a balance greater than 0
  def valid?
    if status != "open" || balance == 0
      false
    else
      true
    end
  end

#can close its account
  def close_account
    self.status = "closed"
  end

end
