require 'pry'

class Transfer
attr_accessor :transfer, :sender, :receiver, :status, :amount, :all
@@all = []

  def initialize(sender, receiver, amount)
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
    @@all << self
  end

  def both_valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if sender.valid? == true && self.status != "complete"
      receiver.deposit(amount)
      sender.debit(amount)
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
      sender.valid? != true #|| sender.balance < amount
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
  end
    #   can reject a transfer if the sender doesn't have a valid account
  def reverse_transfer
    if status = "complete"
      sender.deposit(amount)
      receiver.debit(amount)
      self.status = "reversed"
    end
  end
    #   can reverse a transfer between two accounts 
    #   it can only reverse executed transfers 

end

# Transfers start out in a "pending" status. 
# They can be executed and go to a "complete" state. 
# They can also go to a "rejected" status. A completed 
# transfer can also be reversed and go into a "reversed" status.



