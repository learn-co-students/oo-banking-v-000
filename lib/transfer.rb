class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  attr_reader :transfer
  TRANSFERS = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if sender.valid? && receiver.valid? == true
      true
    else
      false
    end
  end

  def transfer=(transfer)
    @transfer = transfer
    TRANSFERS << transfer
  end

  def execute_transaction
    if valid? == true && self.status == 'pending'
      receiver.balance += amount
      sender.balance -= amount
      self.status = 'complete'
    elsif valid? == false || self.status == 'complete'
      puts 'Transaction rejected. Please check your account balance.'
      self.status = 'rejected'
    end
  end

  def reverse_transfer
    if TRANSFERS.include(transfer)
    receiver.balance -= amount
    sender.balance += amount
  end

end
