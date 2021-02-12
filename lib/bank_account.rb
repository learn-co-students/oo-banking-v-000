class BankAccount

attr_accessor :balance, :status
attr_reader :name

  def initialize(name, status = "open", balance = 1000)
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(money)
    #add deposit to balance
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?

    if @status == "open"  && @balance > 0
      return true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end


end
