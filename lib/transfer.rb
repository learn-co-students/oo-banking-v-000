class Transfer
  attr_accessor :sender,:receiver,:amount,:status 
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = 'pending'
    @amount = amount 
  end

  def both_valid?
    if sender.valid? && receiver.valid? 
      true 
    else 
      false 
    end 
  end

  def execute_transaction 
   if sender.valid? && status == 'pending' && sender.balance > @amount
    sender.balance -= 50 
    receiver.balance += 50 
    @status = 'complete'
   else 
    reject_transfer

   end 
  end

  def reject_transfer
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer 
    if @status == 'complete'
       receiver.balance -= 50 
       sender.balance += 50 
       @status = 'reversed'

    end 
    
  end












end