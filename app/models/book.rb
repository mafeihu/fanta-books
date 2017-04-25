# == Schema Information
#
# Table name: books
#
#  id         :uuid             not null, primary key
#  title      :string
#  isbn       :string
#  external   :string
#  cover      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_books_on_isbn  (isbn) UNIQUE
#

class Book < ApplicationRecord
  validates :isbn, presence: true, length: {is: 13}

  after_create_commit :douban

  def cover
    read_attribute(:cover) || 'book_default.png'
  end

  def publish
    begin
      response  = Typhoeus.get "https://api.douban.com/v2/book/isbn/#{isbn}"
      content   = JSON.parse(response.body.force_encoding('utf-8'))
      update_columns({
        title: content['title'], external: content['id'],
        cover: content['images']['large']
      })
    rescue Exception => e
      logger.fatal "book: #{isbn} #{e.message}"
    end
  end

  private
    def douban
      BookJob.perform_later id
    end
end
