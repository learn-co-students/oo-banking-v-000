class BankAccount

	attr_accessor :balance, :status

	attr_reader :name

	def initialize(name)
		@name = name
		@balance = 1000
		@status = "open"
	end

	def deposit(num)
		self.balance += num
	end

	def display_balance
		current_balance = self.balance
		return "Your balance is $#{current_balance}."
	end

	def valid?
		if self.status == "open" && self.balance > 0
			true
		else
			false
    end
	end

	def close_account
		self.status = "closed"
	end

end
