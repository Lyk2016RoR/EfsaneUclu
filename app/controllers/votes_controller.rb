class VotesController < ApplicationController
    before_action :set_book
    before_action :set_vote, only: [:update]


    def create

    end



private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
