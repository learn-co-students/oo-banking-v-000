class Transfer
  # code here

  attr_accessor :sender, :receiver, :status, :amount, :balance

  def initialize(sender, receiver, amount)

    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

  def both_valid?
    sender.valid? and receiver.valid?
  end

  def execute_transaction
    if both_valid? and sender.balance > amount and @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      reject_transfer
#       @status = "rejected"
#       "Transaction rejected. Please check your account balance."
    end
  end

    def reverse_transfer
      if @status == "complete"
        sender.balance += amount
        receiver.balance -= amount
        @status = "reversed"
      else
        reject_transfer
    end
  end

  def reject_transfer
#     sender.balance += amount
#     receiver.balance -= amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

#     if sender.account.valid? is false

  end


end