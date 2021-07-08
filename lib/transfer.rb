
class Transfer
  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end

  def valid?
    if sender.status == "open" && receiver.status =="open"
      if sender.valid? && receiver.valid?
        return true
      end
    end

  end

  def execute_transaction

    if sender.balance < self.amount

      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end


    if self.status != "complete"
      
      receiver.balance += self.amount
      sender.balance -= self.amount

      self.status = "complete"

    end


  end


  def reverse_transfer
    if status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end




end
