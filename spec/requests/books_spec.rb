require 'rails_helper'

describe 'Books API', type: :request do 
  let(:first_author) { FactoryBot.create(:author, first_name: 'George', last_name: 'Orwell', age: 70) }
  let(:second_author) { FactoryBot.create(:author, first_name: 'H.G.', last_name: 'Wells', age: 78) }
  
  describe 'GET /books' do
   
    before do # This before will get run before every test in this describe scope
      FactoryBot.create(:book, title: "1984", author: first_author)
      FactoryBot.create(:book, title: "The Time Machine", author: second_author)
    end

    xit 'returns all books' do 

      get '/api/v1/books'
      byebug
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

      expect(JSON.parse(response.body)).to eq(
        {
          "id" => 4,
          "title" => "The Martian",
          "author_name" => "Andy Weir",
          "author_age" => 70
        }
      )
    end
  end

  describe 'DELETE /books/:id' do 
    let!(:book) { FactoryBot.create(:book, title: "1984", author: first_author) }
    
    xit 'deletes a book' do 
    delete "/api/v1/books/#{book.id}"
      
      expect(response).to have_http_status(:no_content)
    end
  end
end