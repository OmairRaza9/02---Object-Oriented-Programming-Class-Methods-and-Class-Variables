class BankAccount
  @@interest_rate = 0.01
  @@accounts = []


  def initialize
    @balance = 0
  end
#whats a writter

  def balance
    @balance
  end

  def deposit(number)
    @balance += number
  end

  def withdraw(number)
    @balance -= number
  end

  def self.interest_rate
    @@interest_rate
  end

  def self.interest_time
    @@accounts.each do |account|
      account.deposit(account.balance * @@interest_rate)
    end
  end
#what is self
  def self.create
    account = BankAccount.new
    @@accounts << account
    return account
  end

  def self.accounts
    @@accounts
  end

  def self.total_funds
    sum = 0
    BankAccount.accounts.each do |account|
      sum += account.balance
    end
    return sum
  end

end
#

omairs_account = BankAccount.create
BankAccount.accounts << omairs_account
omairs_account.deposit(90)

james_account = BankAccount.new
BankAccount.accounts << james_account
james_account.deposit(45)

#
# puts BankAccount.total_funds
# #
# puts BankAccount.accounts.inspect

BankAccount.interest_time

puts BankAccount.accounts.inspect
