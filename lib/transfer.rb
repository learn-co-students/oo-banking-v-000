require 'pry' 

class Transfer
  # create initialize method 
  attr_accessor :sender, :receiver, :status
  attr_reader :amount
 
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
    if @amount > sender.balance
       "Transaction rejected. Please check your account balance."
    
    elsif self.status != "complete" && sender.balance == 1000 && @amount < sender.balance && sender.valid?
        sender.balance -= @amount
        receiver.balance += @amount
        @status = "complete"
      
    # @status != "closed" && @status&& sender.balance == 1000 && receiver.balance == 1000 && @amount < sender.balance 
##      elsif @status != "open" && @balance != 1000
##        "Transaction rejected. Please check your account balance."
#        @status = "rejected"
##    if self.valid? 
##      @status = "complete" 
##      sender.balance -= @amount
##      receiver.balance += @amount
#    else
#      @status = "rejected"
#       "Transaction rejected. Please check your account balance."
#
#    
      end     
  end 
  
  end
