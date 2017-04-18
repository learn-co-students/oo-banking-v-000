#~~~HAVICK WAS HERE~~~


class BankAccount
attr_accessor :balance, :status, :deposit
attr_reader :name

def initialize(name)

@name = name
@balance = 1000
@status = "open"
end

def deposit(amount = 0)
	@balance = @balance + amount

end

def display_balance

"Your balance is $#{self.balance}."


end
def valid?

	self.status == "open" && self.balance > 0

end

def close_account

self.status = "closed"


end
end
