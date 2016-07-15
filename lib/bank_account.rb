require 'pry'

class BankAccount
	attr_accessor  :balance, :status
	attr_reader :name

	@balance = []

	def initialize(name)
		@name = name
		@balance = 1000
		@status = 'open'
	end

	def deposit(amount)
		self.balance += amount
	end

	def withdraw(amount)
		self.balance -= amount
	end

	def display_balance
		 "Your balance is $#{self.balance}."
	end

	def valid?
		self.status == 'closed' || self.balance <= 0  ? false : true
	end

	def close_account
		self.status = 'closed'
	end
end
