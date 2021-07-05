class BankAccount

  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name
  end

  def deposit(money)
    @balance = @balance + money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @balance > 0 && status == "open"
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end

end
