class Transfer

  attr_accessor :status
  attr_reader :balance, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @amount = 50
    @receiver = receiver
    @sender = sender
    @status = "pending"
  end

  def valid?
    valid = BankAccount.new(sender) #establish a collaberation between the two classes to check that both accounts are valid
    valid.valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    if @status == "pending"
      bank_account = BankAccount.new(balance)
      @receiver.balance = @receiver.balance + @amount
      @sender.balance = @sender.balance - @amount
      @status = "complete"
    end
    #  1.times(execute_transaction)
    # binding.pry
  end

end
