require_relative 'noticias'

class MediaStack < News
  def self.mediaStack_news(offset)
    fetching_news = get_news(url = "http://api.mediastack.com/v1/news?access_key=2d982b4383a9bf9983f70274b70f6fd3&limit=5&offset=#{offset}")
    choose_results = choose_params(fetching_news, offset)
    order_result = order_news(choose_results, offset)
  end

  def self.choose_params(fetching_news, offset)
    all_data = fetching_news['data']
    selected_data = []
    all_data.each do |data|
      title = data['title']
      author = data['author']
      splited_date = Date.parse data['published_at']
      date = splited_date.strftime("%d%m%Y")
      url = data['url']
      selected_data.push({'title' => title, 'author' => author, 'date' => date, 'url' => url})
    end
    selected_data
  
  end

  def self.order_news(choose_result, offset)
    puts sorted_results = choose_result.sort_by{ |result| result['date'] }
    puts "Selecciona '1' para Leer más noticias \n
      Selecciona '2' para volver"
    selected_menu_option = gets.chomp.to_i

    until (selected_menu_option == 1 || selected_menu_option == 2)
      puts "Eligió una opción inválida \n
      Selecciona '1' para Leer más noticias \n
      Selecciona '2' para volver"
      selected_menu_option = gets.chomp.to_i
    end

    if selected_menu_option == 1
      offset = offset + 5
      Source.api_new_selected(offset, selected_option = 2)
    else
      Source.mostrar_fuentes
    end

  end
end