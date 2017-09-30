class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(num)
    @balance += num
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    if status == "open" && @balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    @status = "closed"
  end

end
