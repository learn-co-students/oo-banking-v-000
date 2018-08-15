class BankAccount

  attr_accessor :balance, :status
  attr_reader :name #BankAccount Instances can't change their name

  def initialize(name)
    @name = name # Initialize with a name
    @balance = 1000 # BankAccount instances always initializes with balance of 1000
    @status = "open" # BankAccount instances always initialize with a status of open
  end

  def deposit(deposit_money)
    self.balance += deposit_money # Deposits money into its account
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    balance > 0 && status == "open"
  end

  def close_account
    self.status = "closed"
  end

end
