class QuestionsController < ApplicationController

  def index
    @thing = Question.new
    @questions = Question.all
    @user = User.find_by(id: session[:user_id]) || User.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      flash[:errors] = "oopsies"
      redirect_to :back
    end
  end

  def new
    @thing = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    redirect_to question_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

end
