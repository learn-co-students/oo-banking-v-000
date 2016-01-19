require "pry"
class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @status="pending"
    @sender=sender
    @receiver=receiver
    @amount=amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  
 def execute_transaction
    if self.status == "pending" && both_valid? && sender.balance >= amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end


end


# def reject_transfer
  #   if sender.valid? == false
  #     self.status = "rejected"
  #     "Transaction rejected. Please check your account balance."
  #   else
  #     execute_transaction
  #   end
  # end
