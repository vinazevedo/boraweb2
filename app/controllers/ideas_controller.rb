class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @ideas = Idea.all.order("created_at DESC")
  end

  def show
  end

  def new
    @idea = current_user.ideas.build
  end

  def edit
  end

  def create
    @idea = current_user.ideas.build(idea_params) 
      if @idea.save
        redirect_to @idea, notice: 'A ideia foi criada.' 
      else
        render action: 'new'
      end
  end

  def update

      if @idea.update(idea_params)
        redirect_to @idea, notice: 'A ideia foi atualizada.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_url
  end

  private

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def correct_user
      if user_signed_in?

        @idea = current_user.ideas.find_by(id: params[:id])
        redirect_to ideas_path, notice: "Apenas o criador do evento pode alterá-lo." if @idea.nil?
      end
    end

    def idea_params
      params.require(:idea).permit(:description, :image, :lead, :event_time)
    end
end
