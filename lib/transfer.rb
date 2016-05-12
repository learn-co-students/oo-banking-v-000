require'pry'
class Transfer
  # code here
  attr_accessor :sender, :receiver, :status, :amount, :counter
  attr_reader

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    @counter = 0
  end

  def valid?(account)
    if account.status == 'open' && account.balance > 0
      true
    else
      false
    end
  end

  def both_valid?
    #binding.pry
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
    
  end

  def execute_transaction
    #binding.pry
    @counter += 1
    if @counter == 1 && self.both_valid?
      sender.balance -= amount
      receiver.balance += amount
      @status = 'complete'
    else
      reject_transfer
    end

  end

  def reject_transfer
      #binding.pry
      status = "Transaction rejected. Please check your account balance."
      #binding.pry
  end

  def reverse_transfer

  end






end