require"pry"
class Transfer

  attr_accessor :sender, :receiver, :amount
  attr_reader :status

  def initialize(sender, receiver, amount)
# binding.pry
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status  = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
       @sender.balance -= @amount
       @receiver.balance += @amount
       @status = "complete"
    else
       @status = "rejected"
       return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
 # binding.pry
    if @status == "complete"
       @sender.balance += @amount
       @receiver.balance -= @amount
       @status = "reversed"
     end
  end
end
