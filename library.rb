require 'pry'
class Book

  @@on_shelf = []
  @@on_loan  = []

 def initialize(title, author, isbn)
   @title = title
   @author = author
   @isbn = isbn
 end

 def title
   @title
 end

 def author
   @author
 end

 def isbn
   @isbn
 end

 def self.create(a, b, c)
   new_book = Book.new(a, b, c)  ############
   @@on_shelf << new_book
   return new_book
 end

 def self.available
   return @@on_shelf
 end

 def borrowed
   return @@on_loan
 end

 def browse
   #This class method should return a random book from @@on_shelf (you may need to consult the Array docs to figure out how to do this).
 end

 def lent_out?
   puts "I can tell you if a book is out. Which book would you like to know about?"
   book_name = gets.chomp
   @@onloan.each do |loan|
     if loan == book_name
       puts "The book #{book_name} is currently lent out"
       return true
     else
       puts "The book is available!"
       return false
     end
   end
 end

 #binding.pry
 def self.current_due_date
   Time.now + 3600
 end

 def due_date
   @due_date
 end

 def due_date=(date)
   @due_date = date
 end


 def borrow

   if lent_out? #==true
     puts "Could not check out the book"
     return false
   else #book is available
      @due_date= Book.current_due_date
      @@on_shelf.delete(self)
      @@on_loan << self
     return true
   end
 end

 def return_to_library
   if lent_out? #book is out
     @@on_loan.delete(self)
     @@on_shelf << self
     @due_date = nil
     return true
   else
     return false
   end
 end

 def overdue_books
   overdue_array = []
   @@on_loan.each do |book|
     if Time.now > Book.due_date
       overdue_array << book
     end
   end
 end

end


sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")

#p Book.available

8.times do
  print "+++++++++"
end

#puts Book.borrow.inspect
puts sister_outsider.lent_out?
