class Transfer
  # code here
  attr_accessor :amount

  def initialize(nameone, nametwo, amount)
    @sender = nameone
    @receiver = nametwo
    @amount = amount
    @status = "pending"
  end

  def sender
    @sender
  end

  def receiver
    @receiver
  end

  def status
    @status
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    if @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      #if reject_transfer == false
      @status = "complete"
      #enD
    end
  end


  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end