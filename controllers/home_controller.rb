class HomeController < ApplicationController
  def index
    puts "'Index' is called!"
  end
  def about
    puts "'About' is called!"
    # Instance variable. Can be referenced anywhere ?
    @about_me = "What is my name?"
    @about_number = 777
  end
  def service
    puts "'Service' is called!"
  end
end
