class Transfer
  attr_reader :amount, :sender, :receiver, :status
  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
  end

  def sender
    @sender
  end

  def receiver
    @receiver
  end

  def both_valid?
    sender.valid? && receiver.valid? && sender.balance>@amount
  end

  def reject_transfer
    @status="rejected"
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if (both_valid?) && status=="pending"
      @sender.withdrawal(@amount)
      @receiver.deposit(@amount)
      @status="complete"
    elsif status=="complete"
        "Transfer has already executed."
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if @status=="complete"
      sender.deposit(@amount)
      receiver.withdrawal(@amount)
      @status="reversed"
    end
    return "Already reversed." if @status=="reversed"
  end

end