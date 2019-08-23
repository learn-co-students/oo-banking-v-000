require "pry"
class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if self.sender.valid? == true && self.receiver.valid? == true && self.sender.balance > @amount
      # && the amount of the transfer is less than the amount of the senders balance
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? == true && self.status == "pending"
      @receiver.deposit(@amount)
      @sender.deposit(-@amount)
      self.status = "complete"
      # binding.pry

    else
      self.status = "rejected"
      phrase = "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    #status must be "complete" ...
    #@amount must be added to sender and minus-ed from receiver
    #status must be changed to reversed
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      self.status = "reversed"
    end

  end

end
