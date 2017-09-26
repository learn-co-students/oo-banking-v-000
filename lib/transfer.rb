class Transfer

  attr_accessor :sender, :receiver, :amount, :status, :once_sender, :once_receiver

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

    @once_sender = 0
    @once_receiver = 0
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    @once_sender < 1 ? @sender.balance -= @amount : @sender.balance
    @once_receiver < 1 ? @receiver.balance += @amount : @receiver.balance
    @once_sender +=1
    @once_receiver +=1

    if @sender.valid? == false
      @status = "rejected"
    else
      @status = "complete"
    end

    if @status == "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    @once_sender == 1 ? @sender.balance += @amount : @sender.balance
    @once_receiver == 1 ? @receiver.balance -= @amount : @receiver.balance
    @status = "reversed"
  end

end
