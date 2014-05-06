class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, through: :user_books

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.nickname = auth["info"]["nickname"]
      user.token = auth[:credentials][:token]
    end
  end

  def self.admins
    all.where(admin: true)
  end

  def self.non_admins
    all.where(admin: false)
  end

  def self.get_by_books(books)
    joins(:books).where("books.id IN (?)", books)
  end

end
