class SolverController < ApplicationController
  respond_to :js, :only => :index

  def new
  end

  def index
    @solved_words = []
    word = params[:word].downcase

    @solved_words += WordProcessor.unscramble(word)

    Query.create :text => word,
      :ip => request.remote_ip,
      :operation => 0
  end

end
