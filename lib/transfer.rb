class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
  end

def valid?
sender.valid? && receiver.valid?
end


def execute_transaction
if valid? && sender.balance > amount && self.status == "pending"


elsif sender.status = "rejected"
"Transaction rejected. Please check your account balance."
end

  def reverse_transfer
  end

end
