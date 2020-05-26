class BankAccount
 attr_reader :name
attr_accessor :balance, :status
 def initialize(name,balance=1000,status="open")
   @name=name
   @balance = balance
   @status = status
 end
 def deposit(number)
   @balance += number
 end
 def display_balance
   return "Your balance is $#{@balance}."
 end
 def close_account
   @status = "closed"
 end
 def valid?
   if @status == "open" && @balance > 0
     true
   else
     false
   end
 end
 end
