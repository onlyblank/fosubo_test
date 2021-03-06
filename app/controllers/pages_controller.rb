class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
  def index
  	@tests = Test.all
  end

  def new
  	@test = Test.find(params[:test_id])
  	@questions = @test.questions
  end

  def create 
  	answers = params[:question]
  	answers.each do |key, value|
  		Question.find(key).answers.build(:value => value, :user_id => User.first.id).save!
  	end
  	redirect_to root_path
  end

  def show_results
    @test = Test.find params[:id]
  end

end
