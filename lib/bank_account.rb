class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(balance=1000, status="open", name)
    @balance = balance
    @status = status
    @name = name
  end

  def name=(name)
    raise Error if name != self.name
    @name=name
  end

  def deposit(deposit)
    @balance += deposit
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end

end
