require 'pry'
class Transfer
  attr_accessor :status, :sender, :receiver, :amount, :last_transer 
  @@completed_transfers = []
  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver 
    @amount = transfer_amount
    @status = "pending"
    @last_transer = []
  end 
  
  def valid?
    true if @sender.valid? && @receiver.valid?
  end 
  
  def execute_transaction
  if sender.valid? && sender.balance >= @amount   
    if @@completed_transfers.include?(self) == false && self.valid? == true 
      @sender.balance -= @amount 
      @receiver.balance += @amount 
      @status = "complete"
      @@completed_transfers << self 
    else
      @status = "rejected"
           "Transaction rejected. Please check your account balance."
            
         end 
  else  
    @status = "rejected"
  "Transaction rejected. Please check your account balance."

  end 
  
end


    def reverse_transfer 
      if @status == "complete"
        @sender.balance += @amount
        @receiver.balance -= @amount 
        @status = "reversed"
      end 
    end 

end 