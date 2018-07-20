class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(customer_name)
    @name = customer_name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    @status == "open" && @balance > 0 ? true : false
  end

  def close_account
    @status = "closed"
  end

end

=begin



=end
