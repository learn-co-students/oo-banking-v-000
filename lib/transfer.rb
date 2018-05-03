class Transfer

  attr_accessor :receiver, :amount
  attr_reader :status, :sender

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @amount = transfer_amount
    @status = "pending"
  end

  def valid?
    # binding.pry
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    # binding.pry
    counter = 0
    if counter == 0
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
      counter += 1
    end

  end

  def reverse_transfer
  end

end
