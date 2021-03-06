class Admin::ModeratorsController < Admin::ApplicationController
  def index
    @moderators = Moderator.all
  end

  def edit
    @moderator = Moderator.find(params[:id])
  end

  def update
    @moderator = Moderator.find(params[:id])
    if @moderator.update(moderator_params)
      flash[:success] = "Moderator details updated successfully."
      redirect_to admin_moderators_path
    else
      render 'edit'
    end
  end


  private
  def moderator_params
    params.require(:moderator).permit(:fullname, :username, :password)
  end


end