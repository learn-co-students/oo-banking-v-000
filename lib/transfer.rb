class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  # your code here
  def initialize(sndr,rcvr, amnt)
    @sender=sndr
    @receiver=rcvr
    @amount=amnt
    @status="pending"
  end
  def  valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
     if sender.valid? && @status != "complete" && @sender.balance > @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
       @status = "complete"
     else
       @status = "rejected"
      "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
if @status == "complete"
          receiver.balance -= @amount
       sender.balance += @amount
       @status="reversed"
     end

end
end
