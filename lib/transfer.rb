require 'pry'

class Transfer

  @@completed_transactions =[]

  sender = BankAccount.new(name)
  receiver = BankAccount.new(name)
  attr_accessor :status


  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def all
    @@completed_transactions
  end

  def save
    @@completed_transactions << self
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
      if self.valid? == true && self.all.last != self && @sender.balance > @amount
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        self.status ="complete"
        self.save
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end

  def reverse_transfer
      if self.all.last.status == "complete"
      last_transaction = self.all.last #sender balance = 950, reciever balance = 1050, amount = 50
      @sender.balance = @sender.balance + last_transaction.amount #this one equals 1000, which is should
      @receiver.balance = @receiver.balance - last_transaction.amount #this is still showing 1000...why?
      self.status = "reversed"
      end
  end

end
