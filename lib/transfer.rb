class Transfer

  attr_accessor :sender, :receiver, :amount, :counter
  attr_reader :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @counter = 0 
  end


  def both_valid?
    # both sender and receiver valid methods return true
    sender.valid? && receiver.valid?
  end


  def execute_transaction
    #take amount, add to receiver, delete from sender
    if @counter == 0 && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @counter += 1
      @status = "complete"

    else
      reject_transfer
    end
  end


  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end


  def reverse_transfer
      if status == "complete"
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"

      else
        reject_transfer
      end
  end
  
end