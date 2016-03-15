class BankAccount
  attr_accessor  :status, :balance
  attr_reader  :name

  def initialize(name)

    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def display_balance
    return "Your Balance is $#{@balance}."
  end

  def close_account
    @status = "closed"
    @balance = 0
  end



end