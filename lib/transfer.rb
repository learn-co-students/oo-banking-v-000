require'pry'
class Transfer
  # code here
  attr_accessor :sender, :receiver, :status, :amount
  attr_reader

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?(account)
    if account.status == 'open' && account.balance > 0
      true
    else
      false
    end
  end

  def both_valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
    
  end

  def execute_transaction
    if status == 'pending'
      sender.balance -= amount
      receiver.balance += amount
      @status = 'complete'
    else
      reject_transfer
    end

  end

  def reject_transfer
      self.status = "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer

  end






end