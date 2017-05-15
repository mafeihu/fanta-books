module BookHelper
  def book_category(book)
    book.tag_list.map{|tag|
      content_tag(:div, tag, class: 'ui label')
    }.join("\n").html_safe
    
  end
end
