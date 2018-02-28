class BankAccount

attr_accessor :bank_account, :balance, :status
attr_reader :name, :broke, :closed

  def initialize(name)
    @bank_account = bank_account
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(num)
    @balance = balance + num
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
     if @status = "closed" || self == @broke
       return false
     elsif @status = "open" || @balance > 0
       return true
    end
  end

  def close_account
    @status = "closed"
  end

end
