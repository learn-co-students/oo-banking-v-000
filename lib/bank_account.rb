class BankAccount

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name
  end

  def balance=(balance)
    @balance = balance
  end

  def status=(status)
    @status = status
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
    return "Your balance is $" + @balance.to_s + "."
  end

  def valid?
    if @status == "open" and @balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    @status = "closed"
  end

end
