class BankAccount
  attr_accessor :status, :balance
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(funds)
    @balance += funds
  end

  def display_balance
    return "Your Balance is $#{self.balance}."
  end

  def valid?
    return (@status=="open" && @balance>0) ? true : false
  end

  def close_account
    @status = "closed"
  end
end
