class SampleController < ApplicationController
  def delete_record
    record = Book.find(params[:id]).destroy!

    render json: { "message": "Record deleted successfully!" }
  end
end
