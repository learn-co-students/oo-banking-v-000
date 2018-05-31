require 'pry'

class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance>@amount? true : false
  end

  def execute_transaction

    if (self.valid? && self.status=='pending')
      @sender.balance-=@amount
      @receiver.balance+=@amount
      @status="complete"
    else
      @status='rejected'
      "Transaction rejected. Please check your account balance."

    end
  end

  def reverse_transfer
    if self.valid? && self.status=='complete'
      @sender.balance+=@amount
      @receiver.balance-=@amount
      @status="reversed"
    else
      "Transaction rejected. Please check your account balance."
    end
  end


end
