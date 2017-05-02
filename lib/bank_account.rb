class BankAccount
	attr_accessor :balance, :status
	attr_reader :name 

	def initialize(name)
		@name = name
		@balance = 1000
		@status = "open"
	end
  	
  	def name=(name)
  		raise AssociationTypeMismatchError, "#{bankaccount.class} received, BankAccount expected." if !bankaccount.is_a?(BankAccount)
  		@name = name  	
 	end

 	def deposit(amount)
 		@balance += amount
 	end

 	def display_balance
 		"Your balance is $#{@balance}."
 	end

 	def valid?
 		@status == "open" && @balance > 0 ? true : false
 	end

 	def close_account
 		@status = "closed"
 		@balance = 0
 	end

end
