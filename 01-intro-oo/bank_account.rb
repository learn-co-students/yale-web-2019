require 'pry'

class BankAccount
  # Owner
  # Balance

  @@all = []

  def initialize(owner_name, balance=0)
    # When you create a new instance
    # of this class, do these steps...

    # Instance variable
    @owner_name = owner_name
    @balance = balance
    # binding.pry
    @@all << self
    puts "We created a new BankAccount"
  end

  def balance
    @balance
  end


  # New function to return back the value
  # of our balance
  # Instance Method****
  def show_owner_name
    @owner_name
  end

  def deposit(funds)
    # is to increase my instance variable balance by the number of funds I'm depositing
    @balance = @balance + funds
    # @balance += funds
  end
  def withdraw(funds)
    # is to decrease my instance variable balance by the number of funds I'm depositing
    if funds > @balance
      puts "INSUFFICIENT MONEY, GET LOST"
    else
      @balance = @balance - funds
    end
    # @balance += funds
  end

  # def BankAccount.all_bankaccounts
  def self.all_bankaccounts
    @@all
  end

end

prince = BankAccount.new("Prince")
gigi = BankAccount.new("Gigi", 1000000)
binding.pry
0
