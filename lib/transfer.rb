# Transfer
#    initialize
#      can initialize a Transfer
#      initializes with a sender
#      initializes with a receiver
#      always initializes with a status of 'pending'
#      initializes with a transfer amount
#    #valid?
#      can check that both accounts are valid
#      calls on the sender and reciever's #valid? methods
#    #execute_transaction
#      can execute a successful transaction between two accounts
#      each transfer can only happen once
#      rejects a transfer if the sender doesn't have a valid account
#    #reverse_transfer
#      can reverse a transfer between two accounts
#      it can only reverse executed transfers

class Transfer
  attr_accessor :transfer, :sender, :receiver, :status, :amount, :valid, :bank_account, :account, :balance

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if self.amount > 0
      if sender.valid? && receiver.valid?
        return true
      end
    else
      return false
    end
  end

  def execute_transaction
    if sender.balance < amount
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    if self.status == "pending"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      self.status = "reversed"
    end
  end
#
#
#
#
end
