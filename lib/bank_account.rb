require 'pry'

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance = 1000)
    @name = name
    @balance = balance
    @status = 'open'
    # binding.pry
  end

  # def balance
  #   @balance
  # end

  def status
    @status
  end

  def name=(name)
    raise NoMethodError if @name != name
    "NameError"
  end

  def deposit(money)
    @balance = balance + money
    # binding.pry
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    if balance > 0 && status == "open"
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end
end
