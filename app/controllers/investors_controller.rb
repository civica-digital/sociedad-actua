class InvestorsController < ApplicationController
  before_action :investor_params, only: :create
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_collaborator, only: [:show, :edit, :update, :destroy]

  def index
   @investors = Investor.all
  end
  
  def show
   
  end

  def edit
    
  end


  def new
    if current_user.profile.nil?
      @investor = Investor.new
    else
      redirect_to root_path
      flash[:notice] = I18n.t('collaborator.notices.profile_already_exists')
    end
  end

  def create
  	@investor = Investor.new(investor_params)
    @investor.user = current_user
    if @investor.save
      flash[:notice] = I18n.t('collaborator.notices.saved')
      redirect_to @investor
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @investor.update(investor_params)
        format.html { redirect_to @investor, notice: I18n.t('investor.notices.updated') }
        format.json { render :show, status: :ok, location: @investor }
      else
        format.html { render :edit }
        format.json { render json: @investor.errors, status: :unprocessable_entity }
      end
    end
  end
  

  private
  def investor_params
    params.require(:investor).permit(:name, :type_investor,
                                    :telephone, :email, :address, :zipcode, :city,
                                    :investment_type, :amount, :constitution, :expense_type,
                                    :neighborhood, :site_url, :facebook_url, :blog_url,
                                    :twitter_url,:youtube_url,:instagram_url,:contact_name,:legal_time,:logo,
                                    causes_supported: [], )
  end

    

  def set_collaborator
     @investor = Investor.find(params[:id])
  end

end
