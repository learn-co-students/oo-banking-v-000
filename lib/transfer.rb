class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
     @sender.valid? && @receiver.valid?
  end

  def execute_transfer
    if both_valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      reciever.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
    

  end


end