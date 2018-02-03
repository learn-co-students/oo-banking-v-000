require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid? #need to verify that both the sender and 
    #receiver are valid accounts. send/rece are part of a BankAccount
    # so valid method can be used on them
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    
    if @status == "pending"
      receiver.balance += self.amount
      sender.balance -= self.amount
      @status = "complete" 
    end
    
    if sender.valid? != true
      @status = "rejected"
      if @status == "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer 
    if @status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      #binding.pry
      @status = "reversed"
    end
  end
  
end
