class BankAccount
	attr_accessor :balance, :status
	attr_reader :name

	def initialize(name)
		@name = name
		@balance = 1000
		@status = "open"
	end

	def deposit(quant)
		@balance += quant
	end

	def display_balance
		"Your balance is $#{@balance}."
	end

	def valid?(withdrawal = 0)
		@status == "open" && @balance - withdrawal > 0
	end

	def close_account
		@status = 'closed'
	end
end
