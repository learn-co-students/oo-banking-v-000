class BankAccount

  attr_accessor :balance, :status
  #attr_writer :name
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(amt)
    @balance = @balance + amt
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status == 'open' && self.balance > 0
      return true
    else
    return false
    end
  end

  def close_account
    self.status = 'closed'
  end

end
# this lab is not being submitted for some reason
