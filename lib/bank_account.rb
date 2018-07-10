class BankAccount
  attr_accessor :status, :balance
  attr_reader :name

  def initialize(name)
    @name=name
    @balance=1000
    @status="open"
  end

  def deposit(deposit_amount)
    @balance+=deposit_amount if deposit_amount>0
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.status=="open" && self.balance>0
  end

  def close_account
    @status="closed"
  end
end
