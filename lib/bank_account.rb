class BankAccount

  attr_reader :name # Using reader because I don't want this to change
  attr_accessor :balance, :status # Using accessor because these can change

  def initialize(name) # initializes with a name
    @name = name
    @balance = 1000 # always initializes with balance of 1000
    @status = "open" # always initializes with a status of 'open'
  end

  def deposit(amount) # can display its balance
    @balance += amount
    display_balance

  end

  def display_balance
    "Your balance is $#{@balance}." # can display its balance
  end

  def valid?
    @status == "open" && @balance > 0 ? true : false # can check that both accounts are valid
    # Saw the following line in another students code, no idea what it does
    # ACCOUNTS.include?(self) && (status == "open") && balance > 0
    # end
  end

  def close_account
    @status = "closed" # can close its account
  end


end
