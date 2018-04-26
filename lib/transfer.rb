class Transfer
attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @status="pending"
    @sender=sender
    @receiver=receiver
    @amount=amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status=="pending" && valid? == true && @sender.balance>=@amount
      @sender.balance-=@amount
      @receiver.balance+=@amount
      @status="complete"
    else
      @status="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status=="complete" && valid?
      @sender.balance+=@amount
      @receiver.balance-=@amount
      @status="reversed"
    end
  end
end
