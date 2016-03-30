class BankAccount
  # code here
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def balance
    @balance
  end

  def status
    @status
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    return "Your Balance is $#{self.balance}."
  end

  def valid?
    if self.status == "open" && self.balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    @status = "closed"
  end

end