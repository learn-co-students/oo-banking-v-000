class Transfer
  # code here
attr_accessor:sender,:receiver,:status,:amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    

  end

  def both_valid?
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
    if @sender.valid? == false || @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    while @status == "complete"
    @receiver.balance -= @amount
    @sender.balance += @amount
    @status = "reversed"
  end
end

end

  



