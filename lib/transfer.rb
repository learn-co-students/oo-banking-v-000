require 'pry'

class Transfer
  attr_accessor :transfer, :sender, :receiver, :status, :amount

  def initialize(transfer, sender, receiver)
    #binding.pry
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end
end
