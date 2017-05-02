class BankAccount

  attr_accessor :balance, :status, :transfers

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @transfers = []
  end

  def name
    @name
  end

  def deposit(num)
    @balance = @balance + num
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    if @balance > 0 && @status == "open"
      return true
    else
      return false
    end
  end

  def close_account
    @status = "closed"
  end

end
