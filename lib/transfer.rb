require 'pry'
require_relative '../lib/bank_account.rb'

class Transfer
  attr_accessor :sender, :receiver, :status
  attr_reader :amount
  @@statuses = ['pending', 'complete', 'rejected', 'reversed']
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = self.class.statuses[0]
    @amount = amount
  end

  def self.statuses
    @@statuses
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def change_status(new_status)
    self.status = new_status
  end

  def execute_transaction
    if self.valid? && self.status == 'pending' && sender.balance >= self.amount
      sender.balance -= self.amount
      receiver.balance +=self.amount
      change_status(self.class.statuses[1])
      self
    else
      change_status(self.class.statuses[2])
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == self.class.statuses[1]
      reversal = Transfer.new(self.receiver, self.sender, self.amount)
      reversal.execute_transaction
      change_status(self.class.statuses[3])
    end
  end

end

account1 = BankAccount.new('jon')
account2 = BankAccount.new('stacy')
transfer = Transfer.new(account1, account2, 50)
