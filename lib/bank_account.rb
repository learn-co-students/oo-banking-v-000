class BankAccount
#==========================================
  # INSTANCE ATTRIBUTES
#==========================================
attr_accessor :balance, :status
attr_reader :name
#==========================================  
  # INSTANCE
#==========================================
  def initialize(name)
    @name = name
    self.balance = 1000
    self.status = "open"
  end
  
  def deposit(amt)
    self.balance += amt
  end
  
  def display_balance
    "Your balance is $#{self.balance}."
  end
  
  def valid?
    self.status == "open" && self.balance > 0? true:false
  end
  
  def close_account
    self.status = "closed"
  end
#==========================================
end
