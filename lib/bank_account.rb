class BankAccount

attr_accessor :balance, :status
attr_reader :name

  def initialize(name, status = "open", balance = 1000)
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(money)
    #add deposit to balance
    self << money

  end

end
