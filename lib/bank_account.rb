require 'pry'
class BankAccount

attr_accessor :balance, :status
attr_reader :name

  def initialize(name, status = "open", balance = 1000)
    @name = name
    @status = status
    @balance = balance
  end

  def deposit(deposit)
    @balance = @balance + deposit
  end

def display_balance
  "Your balance is $#{@balance}."
end

def valid?
 if @status == "closed" || @balance <= 0
   false
 else
   true
  end
end

def close_account
  @status = "closed"
end

end
