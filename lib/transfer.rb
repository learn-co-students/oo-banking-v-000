class Transfer
  attr_accessor  :sender, :reciever, :amount

  def initialize(sender, reciever, amount)
    @sender  = sender
    @reciever = reciever
    @amount = amount
  end
end
