class SolverController < ApplicationController
  respond_to :js, :only => :index

  def new
    @operation = Operation::Jumble

    case request.host.downcase
    when /.*crossword.*/
      @operation = Operation::Crossword
    when /.*scrabble.*/
      @operation = Operation::Scrabble
    end
  end

  def index
    @operation = params[:operation].to_i
    @solved_words = []
    word = params[:word].downcase

    case @operation
    when Operation::Jumble
      @solved_words += WordProcessor.unscramble word
    when Operation::Crossword
      @solved_words += WordProcessor.fill_in_the_blanks word
    end

    Query.create :text => word,
      :ip => request.remote_ip,
      :operation => @operation
  end

end
