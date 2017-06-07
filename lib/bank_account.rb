class BankAccount
      attr_accessor :balance, :status
      #we do not want the name to be changed, so we use attr_reader, when initialzed, it will write the attribute
      attr_reader :name
      @@all_acounts = []
          def initialize(name)
            @name=name
            @balance=1000
            @status = "open"
            @@all_acounts << self
          end
          def deposit(amount)
            @balance = @balance + amount
          end
          def display_balance
            "Your balance is $#{@balance}."
          end
          def valid?
             @balance>0 && @status == "open" ? true : false
          end
          def close_account
            @status = "closed"
          end
end
