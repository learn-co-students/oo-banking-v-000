class BankAccount
  attr_reader:name
  attr_accessor:balance,:status
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    self.balance+= money
  end

  def display_balance
    "Your Balance is $#{balance}."
  end

  def valid?
    status == "open" && balance > 0
  end

  def close_account
    self.status = "closed"
  end

end