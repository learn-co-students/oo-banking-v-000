class Transfer

attr_accessor :transfer, :sender, :receiver, :status, :name

  def initialize(sender, transfer, receiver)
    @transfer = transfer
    @sender = sender
    @status = "pending"

  end



end
