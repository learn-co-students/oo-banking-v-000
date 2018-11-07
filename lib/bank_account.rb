class BankAccount

  attr_accessor :name, :balance, :status

  def name=(name)
    if @name.nil?
      @name = name
    else
      raise NoMethodError, "Seriously do you need to be difficult?"
    end
  end

  def initialize(name)
    self.name = name
    self.balance = 1000
    self.status = "open"
  end

  def deposit(amount)
    self.balance += amount
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
