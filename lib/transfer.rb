class Transfer
  # your code here
  attr_reader
  attr_accessor

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      self.sender -= amount
      self.receiver += amount
      self.status = "completed"
  end

end
