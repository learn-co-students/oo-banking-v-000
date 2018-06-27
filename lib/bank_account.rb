class BankAccount
  attr_accessor :status, :balance

  attr_reader :name
   def initialize(name)
     @name= name
     @balance= 1000
     @status= "open"
   end
   def deposit(number)
     @balance += number
   end
   def display_balance
      return "Your balance is $#{self.balance}."
   end
   def valid?
      if @balance > 0 and @status == "open"
         return true
      else
         return false
      end
   end
   def close_account
      @status = "closed"
   end
end
