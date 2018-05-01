class RootController < ApplicationController
  def welcome
  end

  def first
  	@sub = params[:sub]
  end

  def second
  	@sub = params[:sub]
  end

  def myAction
  	@sub = params[:sub]
  	render 'root/kkk'
  end
end
