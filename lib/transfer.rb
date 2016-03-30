class Transfer
  # code here
  attr_accessor :amount, :sender, :receiver, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
      sender.valid? && receiver.valid? 
  end


  def execute_transaction
      if both_valid? && status=="pending" && sender.balance > amount
        @sender.balance -=  @amount
        @receiver.balance += @amount
        self.status = "complete"
      else
        @status = "rejected"
          return "Transaction rejected. Please check your account balance."
      end
  end


  def reverse_transfer
    if both_valid? && receiver.balance > amount && self.status == "complete"
      @receiver.balance -= amount
      @sender.balance += amount
      self.status = "reversed"
    else
     self.status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end




end