
class Transfer
  # your code here
attr_reader :status
attr_accessor :sender, :receiver

  def initialize(sender, receiver, status = "pending", transfer.amount)
    @sender = sender
    @receiver = receiver
    @status = pending
  end


end
