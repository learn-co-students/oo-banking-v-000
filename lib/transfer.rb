class Transfer
  # code here
  attr_accessor :sender, :receiver, :status
  def initialize(sender, receiver, status="pending")
        @sender = sender
        @receiver = receiver
        @status = status
  end
end