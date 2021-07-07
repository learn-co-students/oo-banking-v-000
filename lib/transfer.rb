require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender,receiver,amount)
    @status="pending"
    @sender=sender
    @receiver=receiver
    @amount=amount
  end
  def valid?
    if @sender.valid? == true and @receiver.valid? == true
      true
    else
      false
    end
  end
  def execute_transaction
    if @status == "pending"
      if @sender.balance < @amount
        reject_transfer
      elsif self.valid? != true
        reject_transfer
      else
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status="complete"
      end
    end
  end
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end