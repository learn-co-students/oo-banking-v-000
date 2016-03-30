class Transfer
  
  attr_reader :sender
  attr_reader :receiver
  attr_reader :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def both_valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if sender.balance - amount < 0
      reject_transfer
    elsif both_valid? && @status == 'pending'
      @sender.withdrawl(amount)
      @receiver.deposit(amount)
      @status = 'complete'
    end
  end

  def reject_transfer
    @status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.deposit(amount)
      @receiver.withdrawl(amount)
      @status = 'reversed'
    end
  end


end