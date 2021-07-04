class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender # initializes with a sender
    @receiver = receiver # initializes with a receiver
    @status = "pending" # always initializes with a status of 'pending'
    @amount = amount # initializes with a transfer amount
  end

  def valid? # calls on the sender and reciever's #valid? methods
    sender.valid? && receiver.valid? ? true : false # TERNARY OPERATION! Sort of an inline if/else.

    # The following line is the same as above:
    # if sender.valid? && receiver.valid?
    #   true
    # else
    #   false
    # end
  end

  def execute_transaction # can execute a successful transaction between two accounts
    return reject_transfer if sender.balance < @amount #  rejects a transfer if the sender doesn't have a valid account
    if @sender.valid? == true && @receiver.valid? == true && @status == "pending"
      receiver.deposit(@amount)
      sender.balance -= @amount
      @status = "complete"
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer # can reverse a transfer between two accounts
    if @status == "complete" # it can only reverse executed transfers
      sender.deposit(@amount)
      receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
