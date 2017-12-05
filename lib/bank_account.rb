class BankAccount
# create attr_reader for name - so that name cannot be changed 
  attr_reader :name, :balance
# create initialize method w/argument (name) 
  def initialize(name)
    @name = name
    @balance = 1000
  end 
# add balance of $1000 to initialize method
# initialize with a status of open (instance variable)
# create attr_reader for name - so that name cannot be changed 
end
