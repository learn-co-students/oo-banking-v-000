
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize(name)
    self.name = name
    self.balance = 1000
    self.status = "open"
  end
  
  def name=(name)
    raise NameError, "Name already set as #{name}" unless @name == nil
    @name = name if @name == nil
  end
  
end
