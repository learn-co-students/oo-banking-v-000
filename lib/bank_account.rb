class BankAccount
     attr_accessor  :balance, :status
     attr_reader :name
     
     def initialize(name, balance = 1000, status = "open")
          @name = name
          @balance = balance
          @status = status
     end
     
     def deposit(deposit_amount)
          @balance = deposit_amount + @balance
          @balance
     end
     
     def display_balance
        return  "Your balance is $#{@balance}."
     end
     
     def valid?
     status == "open" && balance > 0 
     end
     
     
     def close_account
          self.status = "closed"
     end



end
