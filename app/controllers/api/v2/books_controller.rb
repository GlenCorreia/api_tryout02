module Api 
  module V2
    
    class BooksController < ApplicationController
    
      def index
        render json: { name: "GlenSimonCorreia" }
      end
    
    end
    
  end
end
