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
#  download   :string
#  deleted_at :datetime
#
# Indexes
#
#  index_books_on_deleted_at  (deleted_at)
#  index_books_on_isbn        (isbn) UNIQUE
#

class Book < ApplicationRecord
  acts_as_paranoid

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

    # unused
    def qiniu_clean
      Qiniu::Storage.delete(ENV['QINIU_BUCKET'], download)
    end
end
