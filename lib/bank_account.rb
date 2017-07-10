class BankAccount
  attr_accessor :balance, :status
  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
    @@all << self
  end

  def BankAccount.all
    @@all
  end

  def name
    @name
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @status == 'open' && @balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = 'closed'
  end

end
