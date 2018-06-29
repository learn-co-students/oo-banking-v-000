class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if valid? && @status == 'pending' && self.sender.balance > @amount
      self.sender.deposit(-amount)
      self.receiver.deposit(amount)
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      self.sender.deposit(amount)
      self.receiver.deposit(-amount)
      @status = 'reversed'
    end
  end
end

# let(:avi) { BankAccount.new("Avi") }
# let(:amanda) { BankAccount.new("Amanda") }
# let(:transfer) { Transfer.new(amanda, avi, 50) }
# let(:bad_transfer) { Transfer.new(amanda, avi, 4000) }
