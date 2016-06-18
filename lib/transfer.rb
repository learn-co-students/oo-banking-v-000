
class Transfer
  attr_accessor :sender, :receiver, :amount
  attr_reader :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if BankAccount.valid? == true
      binding.pry
    end
  end



end
