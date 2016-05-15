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
    reject_transfer if both_valid? == false
    sender.deposit(-1*@amount)
    receiver.deposit(@amount)
    @amount_save = @amount
    @amount = 0
    @status = "complete"
  end

  def reject_transfer
    "Transaction rejected. Please check your account balance." if sender.valid? == false
    @status = "rejected"
  end



end
