require "pry"
class BankAccount

    attr_accessor :balance, :status#, :money
    attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    # @money = 0
  end

  def deposit(money)
    self.balance = @balance + money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.status == "open" && @balance > 0
  end

  def close_account
    self.status = "closed"
  end

end
