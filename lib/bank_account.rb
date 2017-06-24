class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(deposit)
    @balance = balance + deposit
    @balance
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def withdrawal(amount)
    @balance = @balance - amount
  end

  def rejected
    self.status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end
  
  def valid?
    if status == "open" && balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    @status = "closed"
  end
end
