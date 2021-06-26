class BankAccount

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name
  end

  def balance
    @balance
  end

  def balance=(new_balance)
    @balance = new_balance
  end

  def status
    @status
  end

  def status=(new_status)
    @status = new_status
  end

  def deposit(balance)
   @balance = @balance + balance
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @balance >= 1000 && @status == "open"
  end

  def close_account
     @status = "closed"
  end

end
