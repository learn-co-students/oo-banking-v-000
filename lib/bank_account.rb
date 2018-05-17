class BankAccount
  
  attr_accessor 
  attr_reader :balance, :status, :name
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
end
