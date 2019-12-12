class BankAccount
attr_accessor :name, :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name=(name)
    raise_error
    
  end

  def deposit(number)
    @balance += number
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    status == "open" && balance > 0
  end

  def close_account
    @status = "closed"
  end



end
