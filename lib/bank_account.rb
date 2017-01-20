class BankAccount
attr_accessor  :balance, :status
attr_reader :name

def initialize(name)
  @name = name
  @name.freeze
  @balance = balance
  @balance = 1000
  @status = status
  @status = "open"
end# of initialize


def deposit(amount)
@balance += amount
end# of depost


def display_balance
    "Your balance is $#{@balance}."
end# of display_balance


def valid?
  @status == "open" && @balance > 0 ? true : false
end# of valid?


def close_account
  self.status = "closed"
end#close_account

end
