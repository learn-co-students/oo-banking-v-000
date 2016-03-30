class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

#ACTION METHODS
#---- DEPOSITING
  def deposit(money)
    self.balance += money
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    if self.balance == 0 || self.status == "closed"
      false
    else
      true
    end 
  end

  def close_account
    self.status = "closed"
  end
end