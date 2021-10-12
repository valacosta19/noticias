require_relative "noticias"
require_relative "news_api"
require_relative "mediastack_news"

class Source

  def initialize
    @noticia = []
  end

  def self.mostrar_fuentes

    offset = 1
    
    print "Indique la fuente que desea leer \n
    Selecciona '1' para News Api \n
    Selecciona '2' para Media Stack \n
    Selecciona '3' para salir \n"
    
    selected_option = gets.chomp.to_i

    until (selected_option == 1 || selected_option == 2 || selected_option == 3)
      puts "Seleccionó una opción inválida \n
      Selecciona '1' para News Api \n
      Selecciona '2' para Media Stack \n
      Selecciona '3' para salir \n"
      selected_option = gets.chomp.to_i
    end

    if (selected_option == 3) 
      return 
    end
    
    api_new_selected(offset, selected_option)

  end

  def self.api_new_selected(offset, selected_option)
    if selected_option == 1
      @noticia = NewsApi.reddit_news(offset)
    elsif selected_option == 2
      @noticia = MediaStack.mediaStack_news(offset)
    elsif selected_option == 3
      return
    end
  end
  

end


Source.mostrar_fuentes