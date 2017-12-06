require 'pry' 

class Transfer
  # create initialize method 
  attr_accessor :sender, :receiver, :status
  attr_reader :amount
 
  def initialize(sender, receiver, amount)
    # - method should initialize with the following
    # - sender = equal to the BankAccount instance
    @sender = sender
    # - receiver = equal to other BankAccount instance
    @receiver = receiver
    # - status of "pending"
    @status = "pending"
    # - transfer amount = amount
    @amount = amount
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
   
    if @status != "complete" && sender.balance > @amount && valid? 
        sender.balance -= @amount
        receiver.balance += @amount
        @status = "complete"
    else 
        @status = "rejected"
         "Transaction rejected. Please check your account balance."
      end     
  end 
  
# create reverse_transfer method where amount that is transferred is put back into receiver's account and debited from sender's account 
  # - @amount 
  def reverse_transfer 
    sender.balance += @amount
    receiver.balance -= @amount
  end 
  
  end
