require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :status
  attr_reader  :amount

  def initialize(from_account, to_account, transfer_amount)
    @sender = from_account
    @receiver = to_account
    @amount = transfer_amount
    @status = 'pending'
  end

  def both_valid?

    sender = BankAccount.accounts.find { |account|
      account.name == @sender.name}

    receiver = BankAccount.accounts.find { |account|
      account.name == @receiver.name }

    sender.valid? && receiver.valid?

    # send = BankAccount.accounts.find {|account| account.name == sender.name }.valid?
    # send && receive
  end

  def execute_transaction

    if sender.valid? && sender.balance >= amount
      if status == 'pending'
        sender.balance -= amount
        receiver.balance += amount
        @status = 'complete'
      end
    else
      reject_transfer
    end

  end

  def reject_transfer

    @status = 'rejected'
    'Transaction rejected. Please check your account balance.'

  end

  def reverse_transfer

    if status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      @status = 'reversed'
    end

  end

end