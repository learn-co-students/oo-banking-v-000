class Transfer
  attr_accessor  :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender  = sender
    @reciever = receiver
    @amount = 50
    @status  = "pending"
  end

  def valid?
    sender.valid?  &&  receiver.valid?
  end
end

svi = BankAccount.new("aa")

puts svi
