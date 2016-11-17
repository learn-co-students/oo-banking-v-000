class Transfer

  def initialize(from, to, amount)
    @from_account    = from
    @to_account      = to
    @transfer_amount = amount
    @transfer_status = 'pending'
  end

  def amount
    @transfer_amount
  end

  def execute_transaction
    if !@from_account.valid?(@transfer_amount)
      @transfer_status = 'rejected'
      "Transaction rejected. Please check your account balance."
    elsif @transfer_status != 'complete'
      @from_account.deposit(-@transfer_amount)
      @to_account.deposit(@transfer_amount)
      @transfer_status = 'complete'
    end
  end

  def reverse_transfer
    if @to_account.valid?(@transfer_amount) && @transfer_status == 'complete'
      @to_account.deposit(-@transfer_amount)
      @from_account.deposit(@transfer_amount)
      @transfer_status = 'reversed'
    end
  end

  def receiver
    @to_account
  end

  def sender
    @from_account
  end

  def status
    @transfer_status
  end

  def valid?
    @from_account.valid? && @to_account.valid?
  end
end
