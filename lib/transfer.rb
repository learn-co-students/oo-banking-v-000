require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    # binding.pry
    sender.valid? && receiver.valid? ? true : self.status = "rejected"

    #works just fine like this, so long as "sender" & "receiver"
    #are objects of class BankAcount
    #meaning if the Transfer's initialized with just a string, 
    #this will reject it, b/c it's not checking for that string.
    #will need to update #valid? to check for string 

  end

  def execute_transaction
    if self.both_valid? && (self.status = "pending")
      binding.pry
      sender.deposit(-amount)
      receiver.deposit(amount)
      self.status = "complete"
    else
      reject._transfer
    end
    binding.pry
    #This takes the result of #both_valid? and: 
      #1. checks that transfer.status == "pending"
      #2. debits sender's acct
      #3. credits receiver's acct
      #4. changes transfer.status to either "executed" or "rejected"
    #

  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transaction
    if self.status == "completed"
      receiver.deposit(-amount)
      sender.deposit(amount)
      self.status = "reversed"
    else
      reject_transfer
    end
  end

end