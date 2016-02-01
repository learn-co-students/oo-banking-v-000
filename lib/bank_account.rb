class BankAccount
  attr_accessor :status, :balance
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    return "Your Balance is $#{@balance}."
  end

  def valid?
    return (@status == 'open' && @balance > 0)
  end

  def close_account
    @status = 'closed'
  end

end