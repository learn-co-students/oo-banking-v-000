class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @status = "pending" #an instance of the Transfer class initializes with a staus of "pending"
    @sender = sender #an instance of the Transfer class initializes with a sender
    @receiver = receiver #an instnace of the Transfer class intitializes with a reciever
    @amount = amount #an instance of the Transfer class initializes with a an amount
  end

  #can check that both accounts are valid & uses #valid? from BankAccount class
  def valid? 
    if self.sender.valid? == true && self.receiver.valid? == true && sender.balance >= self.amount
      true
    else
      false
    end
  end

  #can execute a successful transaction between two accounts
  def execute_transaction
    if self.valid? == true && self.status == "pending" #each transfer can only happen once
      receiver.balance += self.amount
      sender.balance -= self.amount
      self.status = "complete" #each transfer can only happen once
    else #rejects a transfer if the sender doesn't have a valid account
      self.status ="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  #can reverse a transfer between two accounts
  def reverse_transfer
    if self.status == "complete" #it can only reverse executed transfers
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed"
    end
  end

end
