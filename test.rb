class BankAccount

  attr_accessor :name, :status

  def initialize(name)
    @name = name
    @status = 'open'
  end

  def print
    puts status
    status = 'jomo'
    puts status
  end
  
end

a = BankAccount.new("Avi")

a.print