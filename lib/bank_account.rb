class BankAccount
  # attr_accessor :account, :balance, :status
  # Refactor based on solution
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    # @account = account
    @name = name
    @balance = 1000
    @status = "open"
  end

  # def deposit(deposit)
  def deposit(deposit_amount)
    # @balance += deposit
    self.balance += deposit_amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    # if @balance > 0 && @status == "open"
    #   true
    # else
    #   false
    # end
    # Refactored based on solution
    balance > 0 && status == "open"
  end

  def close_account
    # @status = "closed"
    self.status = "closed"
  end
end
