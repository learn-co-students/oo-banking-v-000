class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    self.name = name
    self.balance = 1000
    self.status = "open"
  end

  def name=(name)
    unless @name === nil
      raise NameError, "Name already set as #{name}"
    else
      @name = name
    end
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    if balance === 0 || status === "closed"
      false
    else
      true
    end
  end

  def close_account
    self.status = "closed"
  end
end