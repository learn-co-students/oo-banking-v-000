class BankAccount
#------------------------------------------------------------------
#vars and macros
attr_accessor :balance, :status




#------------------------------------------------------------------
#instance
def initialize (name)
@name = name
@balance = 1000
@status = "open"

end

def name
@name.dup    
end


def deposit (amt)
@balance += amt
end
def withdrawal (amt)
@balance -= amt
end



def display_balance
"Your balance is $#{@balance}."
end

def valid?
if @balance > 0 && status == "open"
    true
else
    false
    end
end


def close_account
@status = "closed"
end



#------------------------------------------------------------------
#class


end
