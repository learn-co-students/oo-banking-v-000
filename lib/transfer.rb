class Transfer
  # your code here
  # attr_accessor :transfer, :sender, :receiver, :status, :amount

  # Refactored based on solution

  attr_accessor :status
  attr_reader :amount, :sender, :receiver
  def initialize(sender, receiver, amount)
    # @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    # if sender.valid? && receiver.valid?
    #   true
    # else
    #   false
    # end
    # Refactor based on solution
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && valid? && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      # @status = "rejected"
      # "Transaction rejected. Please check your account balance."
      # reject_transfer per solution
      reject_transfer
    end
  end

  def reverse_transfer
    if execute_transaction
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
      # else added per solution
    else
      reject_transfer
    end
  end

  # rejected_transfer methos added per solution
  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
