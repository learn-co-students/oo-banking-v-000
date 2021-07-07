class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  @last_transfer_rec = 0

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end


  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end

  private

  attr_writer :name
end
