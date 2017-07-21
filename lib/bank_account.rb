class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    if @balance == 0 || @status == "closed"
      return false
    else
      return true
    end
  end

  def close_account
    @status = "closed"
  end

end
