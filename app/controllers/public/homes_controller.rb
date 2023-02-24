class Public::HomesController < ApplicationController
  def top
    @homes = Home.all
  end

  def about
  end
end
