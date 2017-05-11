class BankAccount
	attr_accessor :balance, :status

	def initialize(name)
		@name = name
		@balance = 1000
		@status = "open"
	end

	def name
		@name
	end

	def deposit(money)
		@balance += money
	end

	def withdrawal(money)
		@balance -= money
	end

	def display_balance
		"Your balance is $#{@balance}."
	end

	def valid?
		@balance > 0 && @status == "open"
	end

	def close_account
		@status = "closed"
	end
end
