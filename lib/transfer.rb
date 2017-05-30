require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      #transfer = Transfer.new(sender, receiver, amount)
      #transfer.receiver.balance += amount
      #transfer.sender.balance -= amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
    #if @sender.valid? == false
    #  @status = "rejected"
      #{}"Transaction rejected. Please check your account balance."
  #  end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

  def reject_transfer
   self.status = "rejected"
   "Transaction rejected. Please check your account balance."
 end

end
