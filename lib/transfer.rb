class Transfer
  attr_accessor :pending, :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
   sender.valid? && receiver.valid?
  end

 def execute_transaction
   if status == "complete"
     "Only one transaction can be completed"
   elsif sender.valid? == false || sender.balance < amount
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
   else
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
   end
 end

  def reverse_transfer
    if status == "complete"
    sender.balance += amount
    receiver.balance -= amount
    self.status = "reversed"
    end

  end
end
