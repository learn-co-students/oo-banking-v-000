class BankAccount

  attr_accessor :status, :balance
  attr_reader :name

  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end
  
  def deposit(amount)
      @balance += amount
  end
  
  def display_balance
    balance = "Your balance is $#{@balance}."
  end
  
  def valid?
    if status == "open" && @balance > 0; TRUE
    else
      FALSE
    end
  end
  
  def close_account
  @status = "closed"
  end
end
