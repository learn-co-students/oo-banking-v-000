class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && self.status == 'pending' && sender.balance > amount
      @sender.balance -= @amount
      @receiver.balance += @amount
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
    if self.status == 'complete'
       @sender.balance += @amount
       @receiver.balance -= @amount
       @status = 'reversed'
     else
       reject_transfer
     end
  end






end
