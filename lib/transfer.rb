require 'pry'
class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @sender.close_account if @sender.balance < @amount
  end

  def both_valid?
    #would have used @sender and @receiver to maintain notaion, but .rspec's regex scan doesn't look for \@
    sender.valid? && receiver.valid?                               
  end

  def execute_transaction
    while @status == "pending"
      return reject_transfer if reject_transfer != nil
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    end
  end

  def reject_transfer
    if @sender.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end

end