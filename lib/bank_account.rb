class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your Balance is $#{balance}."
  end

  def valid?
    if balance == 0 || status == 'closed'
      false
    else
     true
    end 
  end

  def close_account
    self.status = 'closed'
  end
end
