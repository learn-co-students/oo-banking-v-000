require 'pry' 

class Transfer
  # create initialize method 
  attr_accessor :sender, :receiver, :status, :amount
 
  def initialize(sender, receiver, status)
    # - method should initialize with the following
    # - sender = equal to the BankAccount instance
    @sender = sender
    # - receiver = equal to other BankAccount instance
    @receiver = receiver
    # - status of "pending"
    @status = "pending"
    # - transfer amount = 50
    @amount = 50
  end
  
# create valid? method that checks that both accounts are valid
  # - should be able to run same valid? method from BankAcct
  
  
  
end
