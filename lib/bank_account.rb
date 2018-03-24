class BankAccount
  attr_accessor :name, :balance, :status

  def initialize(name)
    @name = name.freeze
    @balance = 1000
    @status = "open"
  end

  def name=(name)
    raise NoMethodError if @name != name
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
    else false
    end
  end

  def close_account
    self.status = "closed"
  end

end
