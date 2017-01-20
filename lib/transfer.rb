class Transfer
attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @status = "pending"
    @amount = amount
  end# of initialize


  def valid?
    sender.valid? && receiver.valid? && sender.balance >= amount
  end# of valid?


  def execute_transaction
    if valid?  && @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    elsif !valid?
        @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end# of if
  end# of execute_transaction


  def reverse_transfer
    if @status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    end# of if
  end# of reverse_transfer


end# of class
