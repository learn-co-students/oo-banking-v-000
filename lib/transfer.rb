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

  #why does this work?

  def valid?
    sender.valid? && receiver.valid?
  end

  #but not this?

  def both_valid?
    sender.valid? && receiver.valid?
  end

  #how are we linking sender & receiver with a bank account?????

  #SO MANY QUESTIONS!!!!!!! :) 


end
