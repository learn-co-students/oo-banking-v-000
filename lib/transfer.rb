class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
  end

  def execute_transaction
  end

  def reject_transfer
  end

  def reverse_transfer
  end


end