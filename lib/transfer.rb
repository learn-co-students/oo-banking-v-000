require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.valid? == false
      binding.pry
      reject_transfer
    else
      sender.deposit(-1*@amount)
      receiver.deposit(@amount)
      @amount_save = @amount
      @amount = 0
      @status = "complete"
    end
  end

  def reject_transfer
    binding.pry
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end



end
