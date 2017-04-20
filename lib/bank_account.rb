class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    self.balance > 0 && self.status == "open"
    #   true
    # else
    #   false
    # end
  end

  def close_account
    self.status = "closed"
  end

end
