class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  @@completed = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    (sender.valid?) && (receiver.valid?) ? true : false
  end

  def self.completed
    @@completed
  end


  def execute_transaction

    not_repeat = nil
    sufficient_funds = nil

    if self.class.completed.detect{|transfer| transfer == self} == nil
      not_repeat = true
    end

    if self.amount <= self.sender.balance
      sufficient_funds = true
    end

    if self.valid? && not_repeat && sufficient_funds
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      self.class.completed << self
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end


end
