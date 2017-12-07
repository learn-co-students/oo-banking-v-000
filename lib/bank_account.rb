class BankAccount
  attr_accessor :status, :transfer, :balance
  attr_reader :name
  @@all =[]

  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end



  def deposit(amount)
    @balance += amount 
  end


  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    #is valid with an open status and a balance greater than 0
    #@broke = self.new(name)
    #balance = 0
    #@broke = balance
    #@closed = self.new(name)
    #@status = "closed"
    #@closed = @status
    #balance = balance > 0
    if @status == 'open' && @balance > 0
      true
    else
      false
    end
  end

  def close_account
      @status = "closed"
  end


end
