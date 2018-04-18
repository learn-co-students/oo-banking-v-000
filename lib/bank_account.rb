require 'pry'

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name


    def initialize(name) #balance = 1000, status = "open")
      @name = name
      @balance = 1000
      @status = "open"
    end

    def deposit(dep_ammount)
      @balance += dep_ammount
    end

    def display_balance
      "Your balance is $#{@balance}."
    end

    def valid?
      
    end

end
