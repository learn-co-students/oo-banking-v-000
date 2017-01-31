class Transfer

<<<<<<< HEAD
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
=======
attr_reader :receiver, :amount, :sender
  attr_accessor :status
>>>>>>> 916cfd704a9d9bb65fefd80f2d2454ed0dbc000d

  def initialize(sender, receiver, amount)
    @amount = amount
    @receiver = receiver
    @sender = sender
    @status = "pending"
<<<<<<< HEAD
    @amount = amount
=======
>>>>>>> 916cfd704a9d9bb65fefd80f2d2454ed0dbc000d
  end

  def valid?
    sender.valid? && receiver.valid?
  end
<<<<<<< HEAD

  def execute_transaction 
=======

  def execute_transaction

>>>>>>> 916cfd704a9d9bb65fefd80f2d2454ed0dbc000d
    if valid? && sender.balance > amount && self.status == "pending"
    sender.balance -= amount
    receiver.balance += amount
    @status = "complete"
  else
    reject_transfer
<<<<<<< HEAD
=======
  end
>>>>>>> 916cfd704a9d9bb65fefd80f2d2454ed0dbc000d
  end
end

<<<<<<< HEAD
def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
=======
  def reject_transfer
    self.status = "rejected"
"Transaction rejected. Please check your account balance."
>>>>>>> 916cfd704a9d9bb65fefd80f2d2454ed0dbc000d
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
<<<<<<< HEAD
    sender.balance += amount
    receiver.balance -= amount
    @status = "reversed"
  end
  end
end

=======
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    else
      reject_transfer
    end
  end
end
>>>>>>> 916cfd704a9d9bb65fefd80f2d2454ed0dbc000d
