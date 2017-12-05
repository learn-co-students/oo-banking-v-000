require 'pry' 

class Transfer
  # create initialize method 
  attr_accessor :sender, :receiver
  def initialize(sender, receiver, status)
    
    # - method should initialize with the following
    # - sender = equal to the BankAccount instance
    @sender = sender
    # - receiver = equal to other BankAccount instance
    @receiver = receiver
    
    # - status of "pending"
    # - transfer amount = 50
  end 
  
end
