class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit)
    @balance = @balance + deposit
  end

  def display_balance
    valid?
    "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end
end

##-----------------------------------------
#mike = BankAccount.new("Mike")
#puts mike.name
#mike.display_balance
#mike.deposit(-100)
#mike.display_balance
#mike.close_account
#puts mike.status
