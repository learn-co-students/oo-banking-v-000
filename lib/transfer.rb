class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,value)
    @sender= sender
    @receiver= receiver
    @status= "pending"
    @amount= value
  end
end
