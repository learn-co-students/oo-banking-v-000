class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    @balance == 0 || @status == "closed" ? false : true
  end

  def close_account
    @status = "closed"
  end

end # class closer
