class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(name1, name2, amount) 
    @sender = name1
    @receiver = name2
    @status = "pending"
    @amount = amount
  end

  def valid?
    (sender.valid? == true) && (@receiver.valid? == true) ? true : false
  end

  def execute_transaction
    if valid? && @sender.balance > amount
      unless @status == "complete"
        @sender.balance -= amount
        @receiver.balance += amount
        @status = "complete"
      end
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end

end
