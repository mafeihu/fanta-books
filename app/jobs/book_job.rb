class BookJob < ApplicationJob
  queue_as :default

  def perform(id)
    Book.find(id).publish
  end
end
