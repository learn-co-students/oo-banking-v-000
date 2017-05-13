class BankAccount

  attr_accessor :deposit, :balance, :status #:broke, :closed

  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @deposit = 0
    @status = "open"
  end

  def deposit(deposit = 0)
    total = self.balance + deposit
    self.balance = total
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    balance > 0 && status == "open" && name != ""
  end

  def close_account
    @balance = 0
    @status = "closed"
  end

  # def reject_transfer
  #   if sender.valid? == false
  #     "Transaction rejected. Please check your account balance."
  #   end
  # end

end
