class BankAccount
	attr_accessor :balance, :status
	attr_reader :name

	#has_many :transfers 

   def initialize(name, balance = 1000, status = 'open')
    @name = name
    @balance = balance
    @status = status
  end

  def valid?
   	  self.status === 'open' && self.balance > 0 
  end

  def display_balance
  	return "Your balance is $#{self.balance}."
  end

   def deposit(transfer)
   	 self.balance = self.balance + transfer
   end

   def close_account
   	self.status = 'closed'
   end
end
