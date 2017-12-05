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
  def valid?
    sender.valid?
    receiver.valid?
  end 
  
# create execute_transaction method 
  # - takes transfer amount @amount subtracts from sender and adds to receiver balance 
  def execute_transaction
    if @status != "complete"  
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"  
    elsif !sender.valid?
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
      
  end
    
  end 
  
  
  end
