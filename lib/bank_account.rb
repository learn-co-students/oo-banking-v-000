class BankAccount

	attr_accessor :status, :balance
	attr_reader :name

	def name=(name)
		raise ImmutableAttr.new ("Can't change name")
	end

	def initialize(name)
		@name = name
		@balance = 1000
		@status = "open"
	end

	def deposit(amount)
		self.balance += amount
	end

	def display_balance
		"Your balance is $#{self.balance}."
	end

	def valid?
		if self.balance > 0 && self.status == "open"
			return true
		else
			return false
		end
	end

	def close_account
		self.status = "closed"
	end

end
