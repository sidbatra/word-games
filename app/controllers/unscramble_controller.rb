class UnscrambleController < ApplicationController
  respond_to :js, :only => :index

  def new
  end

  def index
    @unscrambled_words = []
    scrambled_words = params[:scrambled_words]
    scrambled_words ||= ""

    scrambled_words.split.each do |word|
      @unscrambled_words += WordProcessor.unscramble word
    end
  end

end
