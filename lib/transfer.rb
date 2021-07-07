class Transfer
  attr_reader  :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? == true

  end

  def execute_transaction
    # binding.pry
    if @sender.balance > @amount && valid? == true && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if @receiver.balance > @amount && valid? == true && self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
      self.status = "rejected"
     return "Transaction rejected. Please check your account balance."

  end
end
