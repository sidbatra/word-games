class SolverController < ApplicationController
  respond_to :js, :only => :index

  def new
    case request.host.downcase
    when /.*crossword.*/
      @operation = Operation::Crossword
      @google_analytics_id = "UA-38966972-2"
    when /.*scrabble.*/
      @operation = Operation::Scrabble
      @google_analytics_id = "UA-38966972-3"
    else
      @operation = Operation::Jumble
      @google_analytics_id = "UA-38966972-1"
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
    when Operation::Scrabble
      @solved_words += WordProcessor.anagram word
    end

    Query.create :text => word,
      :ip => request.remote_ip,
      :operation => @operation
  end

end
