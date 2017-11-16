class BankAccount
  attr_accessor :name, :balance, :status
  def initialize(name)
    @name=name
    @balance=1000
    @status="open"
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def raise_exception
    raise 'An error has occured'
  end

  def name=(name)
    raise_exception
  end

def deposit(deposit)
  @balance+=deposit
end

def valid?
  if @status=="open"&& @balance>0
    return true
  else
    return false
  end
end

def close_account
   @status="closed"
end

end
