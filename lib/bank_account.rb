class BankAccount

attr_accessor :balance, :status
attr_reader :name

  def initialize(name, status = "open", balance = 1000)
    @name = name
    @balance = balance
    @status = status
  end

  def deposit
    transfer = Transfer.new(name)
    self << transer
  end

end
