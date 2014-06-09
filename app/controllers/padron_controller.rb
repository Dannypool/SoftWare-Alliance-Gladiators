class PadronController < ApplicationController
  def index
  @padron = Person.all
  end
end
