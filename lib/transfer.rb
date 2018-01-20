class Transfer
  attr_accessor  :sender, :reciever, :amount

  def initialize(sender, reciever, amount)
    @sender  = sender
    @reciever = reciever
    @amount = 50
    @status  = "pending"
  end
end
