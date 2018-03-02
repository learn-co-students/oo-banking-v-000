class BankAccount

    attr_accessor :bank_account, :balance, :status
    attr_writer :broke, :closed
    attr_reader :name

      def initialize(name)
        @bank_account = bank_account
        @name = name
        @balance = 1000
        @status = "open"
      end

      def deposit(num)
        @balance = balance + num
      end

      def display_balance
        "Your balance is $#{@balance}."
      end

      def valid?
        if self.status == "open" && self.balance > 0
          return true
        else
          return false
        end
      end

      def close_account
        @status = "closed"
      end

  end
