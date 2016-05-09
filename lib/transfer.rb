class Transfer
  
  attr_accessor :receiver, :sender, :amount 
  attr_reader :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @amount = amount
    @receiver = receiver
    @status = "pending"
  end


  def both_valid? 

    if @sender.valid? == true && @receiver.valid? == true 
      return true
    else
      return false
     end 
   end
  

  def execute_transaction
    if self.status == "pending"
      if @sender.balance - amount <= 0
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      else
        @sender.balance = sender.balance - amount 
        @receiver.balance = receiver.balance + amount
        @status = "complete"
      end
    end
  end




  def reverse_transfer
  
    if @status == "complete"
      @sender.balance = sender.balance + amount
      @receiver.balance = receiver.balance - amount
      @status = "reversed"
    end


  end










end