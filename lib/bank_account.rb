require 'pry'
class BankAccount
  attr_accessor :account, :balance, :status
  attr_reader :name
  @@account = []
  @transactions = []
    
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?#(account, balance)

#NoMethodError:                                                                                                                 
#undefined method `balance=' for #<BankAccount:0x00000002728128>
#Did you mean?  balance                                                                                                       
# ./spec/banking_spec.rb:46:in `block (3 levels) in <top (required)>'  

    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end
end