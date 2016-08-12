class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name 
    @balance = 1000
    @status = "open"
   
  end

  def deposit(deposit_amount)
    @balance += deposit_amount      #can deposit money into its account
  end

  def display_balance
    "Your balance is $#{balance}."
  end


  def valid?
    if self.status == "open" && self.balance > 0 
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end
end
