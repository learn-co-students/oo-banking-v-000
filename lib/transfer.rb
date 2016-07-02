require "pry"
class Transfer

  attr_accessor :status, :amount
  attr_reader :balance, :sender, :receiver

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
  # end
  end

  def execute_transaction
    if @status == "pending"
      bank_account = BankAccount.new(balance)
      @receiver.balance = @receiver.balance + @amount
      @sender.balance = @sender.balance - @amount
      @status = "complete"
    end
    if !valid?
        @status = "rejected"
        "Transaction #{status}. Please check your account balance."
        reverse_transaction

            # binding.pry
    end
  end

    def reverse_transfer
      if execute_transaction || !execute_transaction
        @receiver.balance = @receiver.balance - @amount
        @sender.balance = @sender.balance + @amount
        @status = "reversed"
        # binding.pry
    end

  end

end
