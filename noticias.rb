require 'json'
require 'rest-client'
require 'pry'

class News 

  attr_accessor :titulo, :autor, :fecha, :url

  def initialize(titulo, autor, fecha, url)
    @titulo = titulo
    @autor = autor
    @fecha = fecha
    @url = url
  end

  def self.get_news(url)
    response_first = RestClient.get(url)
    @result_first = JSON.parse(response_first)
  end

end
