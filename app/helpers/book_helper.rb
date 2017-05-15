module BookHelper
  def book_category(book)
    book.tag_list.map{|tag|
      content_tag(:div, tag, class: 'ui label')
    }.join("\n").html_safe
    
  end

  def book_title(book)
    link_to book.title, "https://book.douban.com/subject/#{book.external}/", target: '_blank' if book.external.present?
  end
end
