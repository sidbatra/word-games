class SolverController < ApplicationController
  respond_to :js, :only => :index

  def new
  end

  def index
    @operation = params[:operation].to_i
    @solved_words = []
    word = params[:word].downcase

    case @operation
    when Operation::Jumble
      @solved_words += WordProcessor.unscramble(word)
    end

    Query.create :text => word,
      :ip => request.remote_ip,
      :operation => @operation
  end

end
