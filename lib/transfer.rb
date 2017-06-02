require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :counter

  # Transfer Transfer initialize can initialize a Transfer
  # Transfer Transfer initialize initializes with a sender
  # Transfer Transfer initialize always initializes with a status of 'pending'
  # Transfer Transfer initialize initializes with a transfer amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @counter = 0
  end

  # Transfer Transfer #valid? can check that both accounts are valid
  # Transfer Transfer #valid? calls on the sender and reciever's #valid? methods
  def valid?
    @sender.valid?
    @receiver.valid?
  end

  # Transfer Transfer #execute_transaction can execute a successful transaction between two accounts
  # Transfer Transfer #execute_transaction each transfer can only happen once
  # Transfer Transfer #execute_transaction rejects a transfer if the sender doesn't have a valid account
  def execute_transaction
    if @counter != 0
      @status = 'rejected'
      false
    elsif !@sender.valid? || @sender.balance <= @amount
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    else
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @counter += 1
      @status = 'complete'
    end
  end

  # Transfer Transfer #reverse_transfer it can only reverse executed transfers
  def reverse_transfer
    if @counter == 1
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = 'reversed'
    end
  end
end
