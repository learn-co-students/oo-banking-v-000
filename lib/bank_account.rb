class BankAccount
  attr_accessor :balance, :status, :sender, :receiver
  attr_reader :dep_amount, :name


  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(dep_amount)
    @dep_amount = dep_amount
    self.balance += dep_amount
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    if (self.status == "open" && balance > 0) then
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end


end
