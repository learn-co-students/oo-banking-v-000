require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    # can check that both accounts are valid
    # if both the sender's account is valid and the receiver's account is valid, the transfer is valid.
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    # can execute a successful transaction between two accounts
    # remove amount from the sender's account and add amount to the reciever's account
    # change status from "pending" to "complete"
    # each transfer can only happen once.
    # Method checks if status is complete, if it isn't, it makes the transfer
    # want to make sure the sender has enough money to send
    if self.sender.balance > self.amount
      if self.status == "complete"
        self.sender.balance
        self.receiver.balance
      else
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      end #second if
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end#first if
  end

  def reverse_transfer
    # can reverse a transfer between two accounts
    # it can only reverse executed transfers
    # and changes the instances status to reversed
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end

  end

end
