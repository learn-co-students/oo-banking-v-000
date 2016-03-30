class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your Balance is $#{balance}."
  end

  def valid?
    #account is open and balance > 0 = valid
    if @status == 'open' and @balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = 'closed'
  end
end