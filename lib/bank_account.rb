class BankAccount

  attr_accessor :balance, :status
  attr_reader :name                    #can't change name after init

  def initialize(name)
    @name = name                       #init with accountholder name
    @balance = 1000                    #init with 1k
    @status = "open"                   #init account status open
  end

  def deposit(deposit_amt)
    self.balance += deposit_amt     #deposit method adds to existing balance
  end

  def display_balance
    "Your balance is $#{self.balance}." #displays balance with own instance of balance
  end

  def valid?
    self.balance > 0 && self.status == "open" #account is valid? if balance above 0 AND status is open
  end

  def close_account
    self.status = "closed"              #close_account changes instance status to closed
  end

end
