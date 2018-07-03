class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? == true &&  @receiver.valid? == true ? true:false
  end

  def execute_transaction
    if @sender.valid? == true && !@@all.include?(self) && @amount < @sender.balance
      @sender.balance -= @amount
      @receiver.balance += @amount
      @@all << self
      @status = 'complete'
    else
      @status = 'rejected'
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @@all.include?(self)
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end 
  end

end
