class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount) #can initialize a Transfer
    @sender = sender #initializes with a sender
    @receiver = receiver #initializes with a receiver
    @amount = amount #initializes with a transfer amount
    @status = 'pending' #always initializes with a status of 'pending'
  end

  def valid? #check that both accounts are valid
    self.sender.balance > amount && self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction #can execute a successful transaction between two accounts
    if self.status != 'complete' && self.valid? #each transfer can only happen once
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = 'complete'
    elsif !self.valid? #rejects a transfer if the sender doesn't have a valid account
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    else
      "Transaction already completed."
    end
  end

  def reverse_transfer #can reverse a transfer between two accounts
    if self.status == 'complete' #it can only reverse executed transfers
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = 'reversed'
    else
      "Unable to reverse transfer."
    end
  end

end
