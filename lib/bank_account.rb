class BankAccount

  attr_accessor :balance, :status
  attr_reader  :name
  
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(amount)
    self.balance = self.balance + amount
  end
  
  def display_balance
    "Your balance is $#{self.balance}."
  end
  
  def valid?
    if self.balance > 0 && self.status == "open"
      true
    elsif self.balance <= 0 || self.status != "open"
      false
    end
  end
  
  def close_account
    self.status = "closed"
  end
end
