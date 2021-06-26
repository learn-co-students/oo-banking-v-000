class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  # your code here
  def initialize(bank_account_from, bank_account_to, balance)
     @sender = bank_account_from
     @receiver = bank_account_to
     @status = "pending"
     @amount = balance
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount || !valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

    if @status == "pending"
     @receiver.deposit(@amount)
     @sender.balance = @sender.balance - @amount
     @status = "complete"
   end
  end

  def reverse_transfer
    if @status != "complete"
       return
    end

    @sender.deposit(@amount)
    @receiver.balance = @receiver.balance - @amount
    @status = "reversed"
  end


end
