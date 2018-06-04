class BankAccount

attr_accessor :name, :balance, :status

  def initialize(name, status = "open", balance = 1000)
    @name = name
    @balance = balance
    @status = status
  end

end
