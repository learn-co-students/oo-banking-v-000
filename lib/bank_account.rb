class BankAccount

  attr_accessor :name, :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def name=(name)
    if @name != nil
      message = "Can't change name."
      raise Exception.new(message)
    else
      @name = name
    end
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" and @balance > 0
  end

  def close_account
    @status = "closed"
    @balance = nil
  end

end
