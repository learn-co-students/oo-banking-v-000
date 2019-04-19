class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
 # def method_missing(method, e)
  # method.to_s == 'name=' ? false : ''
 #end
 
  def deposit
  end
end
