class BankAccount

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name
  end

  def balance=(amount)
    @balance = amount
  end

  def balance
    @balance
  end

  def status=(status)
    @status = status
  end

  def status
    @status
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  # is valid with an open status and a balance greater than 0
  def valid?
    if self.status == "open" && self.balance > 0
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end
end
