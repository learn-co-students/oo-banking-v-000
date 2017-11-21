require 'pry'
class Transfer
attr_accessor :sender, :receiver, :status, :amount

@@all = []

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    BankAccount.all.find{|account|account == sender}.transfer<<self
  end

  def valid?
    if BankAccount.all.include?(self)
      return true
    elsif BankAccount.all.find{|account|account == @sender}.valid? && BankAccount.all.find{|account|account == @receiver}.valid?
      return true
    else
      return false
    end
  end

  def sender_account_rec
    BankAccount.all.find{|account|account == @sender}
  end

  def execute_transaction
    if self.valid?
      if @amount>self.sender_account_rec.balance
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      elsif @status == "pending"
        @receiver.balance += @amount
        @sender.balance -= @amount
        @status = "complete"
      end
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end


end
