class BankAccount

  attr_accessor :account, :status, :balance
  attr_reader :name

  def initialize(name)
    @name = name
    @account = account
    @status = "open"
    @balance = 1000
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    # if @status == "open" && @balance > 0
    #   true
    # else
    #   false
    # end
    self.status == "open" && self.balance > 0 ? true : false
  end

  def close_account
    self.status = "closed"
  end

end
