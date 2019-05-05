class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name, balance = 1000)
    @name = name
    @balance = balance
    @status = "open"
  end

  def deposit(fat_stacks)
    @balance += fat_stacks
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end

end
