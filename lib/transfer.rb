require 'pry'
require_relative '../lib/bank_account.rb'

class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @status = 'pending'
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.status == 'pending' #valid account and tranfer is in pending status
      if self.sender.balance >= amount #sender has enough money?
        self.sender.balance -= self.amount #ok, do it
        self.receiver.balance += self.amount
        self.status = 'complete'
      else
        self.status = 'rejected' #reject, seller doesn't have money
        "Transaction rejected. Please check your account balance."
      end
    else
      self.status = 'rejected' #either one of the accounts are not valid or transfer is not in pending status
    end
  end

  def reverse_transfer
    if self.valid? && self.status == 'complete' #accounts are valid and transfer was executed before?
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = 'reversed'
    end
  end

end
