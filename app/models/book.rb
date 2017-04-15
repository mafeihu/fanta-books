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
end
