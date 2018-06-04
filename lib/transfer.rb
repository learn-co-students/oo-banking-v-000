class Transfer
  # your code here
attr_reader :status
  
  def initialize(sender, receiver, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = pending
  end


end
