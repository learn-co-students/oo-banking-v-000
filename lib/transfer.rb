require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    BankAccount.all.detect {|account| account.name == sender.name}.valid? && BankAccount.all.detect {|account| account.name == receiver.name}.valid?
  end
end
