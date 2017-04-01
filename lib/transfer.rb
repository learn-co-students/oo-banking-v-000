class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def balance_check?
    if @sender.balance < @amount
      false
    else
      true
    end
  end

  def execute_transaction

    if self.status=="pending" &&self.valid? == true && self.balance_check?
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.deposit(@amount)
      @receiver.withdraw(@amount)
      self.status = "reversed"
    else
      self.status
    end
  end



end
