require 'pry'
class Transfer
  attr_accessor :sender, :status, :receiver, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && self.status == 'pending' && @amount < @sender.balance
      @receiver.deposit(@amount)
      @sender.balance = @sender.balance - @amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer    
    if self.status == 'complete'
      @sender.deposit(@amount)
      @receiver.balance = @receiver.balance - @amount
      self.status = 'reversed'
    end
  end
  #  acts as a space for a transaction between 
  #two instances of the bank account class. 

  #should be able to reject a transfer if the 
  #accounts aren't valid or if the sender doesn't
  # have the money.

#   Transfers start out in a "pending" status. 
#   They can be executed and go to a "complete" 
#   state. They can also go to a "rejected" status.
#    A completed transfer can also be reversed and
#     go into a "reversed" status.
 end
