class BankAccount

  attr_reader :name, :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def deposit(amount)
    @balance = @balance + amount
  end


end
