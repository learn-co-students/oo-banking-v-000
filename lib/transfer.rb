class Transfer

  attr_accessor :status
  attr_reader :amount, :sender, :receiver

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end



end
