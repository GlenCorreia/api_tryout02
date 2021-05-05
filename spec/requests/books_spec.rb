require 'rails_helper'

describe 'Books API', type: :request do 
  describe 'GET /books' do
    before do # This before will get run before every test in this describe scope
      FactoryBot.create(:book, title: "1984", author: "George Orwell")
      FactoryBot.create(:book, title: "The Time Machine", author: "H.G. Wells")
    end

    xit 'returns all books' do 

      get '/api/v1/books'

      expect(response).to have_http_status(:success)
      # expect(JSON.parse(response.body).size).to eq(2) 
    end
  end

  describe 'POST /books' do 
    it 'creates a new book' do 
      post '/api/v1/books', params: { 
        book: { 
          title: 'The Martian'
        },
        author: {
          first_name: 'Andy', last_name: 'Weir', age: 70
        }
      }

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /books/:id' do 
    let!(:book) { FactoryBot.create(:book, title: "1984", author: "George Orwell") }
    
    xit 'deletes a book' do 
    delete "/api/v1/books/#{book.id}"
      
      expect(response).to have_http_status(:no_content)
    end
  end
end