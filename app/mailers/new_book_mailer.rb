class NewBookMailer < ApplicationMailer
  default :from => 'booklovers@book.com'

  def notify_new_book(user, book)
    @book = book
    @user = user
    mail( :to => @user.email,
    :subject => 'Check out this new book!' )
  end

end
