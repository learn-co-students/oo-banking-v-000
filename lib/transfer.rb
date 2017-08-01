class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount


  def initialize(sender, receiver, amt)
    @sender = sender
    @receiver = receiver
    @amount = amt
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status != "complete" && @sender.valid? && @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status ="complete"
      #endif
    elsif !@sender.valid? || @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      #end if BLOCK & elseif
    end
    #end function
  end

  def reverse_transfer
    if @status == "complete"
      tmp = @sender
      @sender = @receiver
      @receiver = tmp
      @status = "pending"
      if execute_transaction() == "complete"
        @status = "reversed"
      end
    end
  end

end
