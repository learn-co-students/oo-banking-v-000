class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name=(name)
    raise_error
  end

  def display_balance
    "Your Balance is $#{@balance}."
  end

  def deposit(amount)
    @balance += amount
  end

  def valid?
    if @status == "open" && @balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    @status = "closed"
  end



end
