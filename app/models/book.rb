class Book < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]

  has_many :types, dependent: :destroy
  has_many :user_books
  has_many :users, through: :user_books

  mount_uploader :cover, CoverUploader

  has_many :book_tags
  has_many :tags, :through => :book_tags

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  def self.with_complete_types
    joins(:types).where(types:{incomplete: false}).uniq
  end

  def self.with_incomplete_types
    joins(:types).where(types:{incomplete: true}).uniq
  end

  def pdf_url
    types.find_by(:format => "PDF").file.url
  end

  def self.create_with_type(params, type)
    b = Book.new(params);
    b.add_type(type)
  end

  def add_type(type)
    if types.collect(&:format).include?(type.format)
      errors.add(:types, "this type already exists")
    else
      types << type
      self
    end
  end

  def tags=(tags)
    book_tags.destroy_all
    tags.each do |tag_id|
      book_tags.build(:tag_id => tag_id) if tag_id != ""
    end
  end

  def self.get_all_with_tags(tags)
    joins(:book_tags).where("book_tags.tag_id in (?)", tags).uniq
  end

  def set_cover_by_epub(epub)
    cover = File.open(epub.cover.tempfile.path) if epub.cover.tempfile
    save
  end

  def self.get_by_user(users)
    joins(:users).where("users.id IN (?)", users)
  end






end
