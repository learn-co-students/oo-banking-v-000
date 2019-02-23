class Transfer
attr_accessor :status, :balance
attr_reader :sender, :name, :amount, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @name = name
    @amount = amount
    @status = "pending"
    @receiver = receiver
    @balance = balance
    @transactions = []
  end 

  def valid?
    @sender == sender && @receiver == receiver
  end 

end
