class BankAccount

  attr_accessor :balance, :status

  def initialize(name)
    @name=name
    @balance = 1000
    @status="open"
  end

  def name
    @name
  end 

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.balance > 0 && self.status == "open"
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end 

end
