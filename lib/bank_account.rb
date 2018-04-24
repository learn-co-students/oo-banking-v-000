class BankAccount
  attr_accessor   :balance,  :status, :amount
  attr_reader   :name,  :reciever

  def initialize (name)
    @name = name
    @status = "open"
    @balance = 1000
  end

  def deposit(deposit)
    self.balance += deposit
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    balance > 0  && status == "open"
  end


  def close_account
    self.status = "closed"
  end
end