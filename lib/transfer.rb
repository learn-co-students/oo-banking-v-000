require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def transfer_in_good_order?
    self.valid? && self.status == "pending" && sender.valid? && self.sender.balance > self.amount
  end

  def reverse_transfer_in_good_order?
    self.status == "complete" && self.receiver.balance > self.amount
  end

  def debit_sender
    self.sender.balance = self.sender.balance - self.amount
  end

  def credit_receiver
    self.receiver.balance = self.receiver.balance + self.amount
  end

  def credit_sender
    self.sender.balance = self.sender.balance + self.amount
  end

  def debit_receiver
    self.receiver.balance = self.receiver.balance - self.amount
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if self.transfer_in_good_order?
      self.debit_sender
      self.credit_receiver
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
# binding.pry
  if self.reverse_transfer_in_good_order?
      self.debit_receiver
      self.credit_sender
      self.status = "reversed"
  else
      reject_transfer
    end
  end

end
