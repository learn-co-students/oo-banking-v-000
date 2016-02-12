require_relative "bank_account.rb"
class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(account_from, account_to, amount)
    @sender=account_from
    @receiver=account_to
    @status="pending"
    @amount=amount
  end

  def both_valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if sender.balance < @amount
      @status="rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status=="pending"
      receiver.deposit(amount)
      sender.deposit(-amount)
      @status="complete"
    end
  end

  def reverse_transfer
     if @status=="complete"
      sender.deposit(@amount)
      receiver.balance-=@amount
      @status="reversed"
    end
  end


end #end class

