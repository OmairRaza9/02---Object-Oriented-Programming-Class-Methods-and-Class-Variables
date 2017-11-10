class BankAccount
@@interest_rate = 0.01
@@accounts = []

  def initialize
    @balance = 0

  end

  def balance
    @balance
  end

  def deposit(number)
    @balance += number
  end

  def withdraw(number)
    @balance -= number
  end

  def self.create
    created_account = BankAccount.new
    @@accounts << created_account
    return created_account
  end

  def self.total_funds
    sum = 0
    @@accounts.each do |account|
      sum += account.balance
    end
  end

  def self.interest_time
    @@accounts.each do |account|
      account.deposit(account.balance * @@interest_rate)
    end
  end
end


omair = BankAccount.new
 omair.deposit(125)
p omair.balance
omair.self
