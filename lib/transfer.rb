require 'pry'
class Transfer

  attr_accessor :status, :amount, :bankaccount, :reject_transfer

  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
   sender.valid? && receiver.valid?
  end

  def reject_transfer
    if sender.valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

 def execute_transaction
   if valid? == true && sender.balance > amount && self.status != "complete" && self.status == "pending"
    sender.balance = sender.balance - amount
    receiver.balance = receiver.balance + amount
    self.status = "complete"
   else
     #"Transaction rejected. Please check your account balance."
     self.reject_transfer
     #self.status = "rejected"

   end
  end

  def reverse_transfer
    if self.status = "complete" && self.status != "reversed" && self.status != "pending"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      self.status = "reversed"
    end

  end
end
