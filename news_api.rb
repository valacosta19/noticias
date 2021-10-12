require './noticias.rb'

class NewsApi < News
  def self.reddit_news(offset)
    fetching_news = self.get_news(url = "https://newsapi.org/v2/everything?q=Apple&from=2021-09-27&sortBy=popularity&apiKey=04569f159ffc4593bbd13ca511ebca20&pageSize=5&page=#{offset}")
    choose_result = choose_params(fetching_news, offset)
    order_result = order_news(choose_result, offset)
  end

  def self.choose_params(fetching_news, offset)
    all_data = fetching_news['articles']
    selected_data = []
    all_data.each do |data|
      title = data['title']
      author = data['author']
      splited_date = Date.parse data['publishedAt']
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
      Source.api_new_selected(offset, selected_option = 1)
    elsif selected_menu_option == 2
      Source.mostrar_fuentes
    end

  end
end