class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status != "complete" && self.valid? && sender.balance > amount
      sender_balance = sender.balance -= self.amount
      receiver_balance = receiver.balance += self.amount
      self.status = "complete"
    else
      self.reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete" && self.valid? && sender.balance > amount
      sender_balance = sender.balance += self.amount
      receiver_balance = receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
  
end


# it "can execute a successful transaction between two accounts" do
#   transfer.execute_transaction
#   expect(amanda.balance).to eq(950)
#   expect(avi.balance).to eq(1050)
#   expect(transfer.status).to eq("complete")
# end
#50 from amanda/sender to avi/receiver