class InvestorsController < ApplicationController
  before_action :investor_params, only: :create
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_investor, only: [:show, :edit, :update, :destroy]

  def index
    @investors = Investor.all
  end

  def show
     @organizations=Organization.where('id in (?)',@investor.organization)
    authorize @investor
    render :layout => "profiles"
  end
  def new
    @organizations=Organization.all
  end 
  def edit
    @organizations=Organization.all
    authorize @investor
  end

  def update
    authorize @investor
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
    params.require(:investor).permit(:investment_type,:money,:voluntering,:specie,:service,:name, :type_investor,
                                    :telephone, :email, :address, :zipcode, :city,
                                     :amount, :constitution, :expense_type,
                                    :neighborhood, :site_url, :facebook_url, :blog_url,
                                    :twitter_url,:youtube_url,:instagram_url,:contact_name,:legal_time,:other_causes,:logo,organization: [],
                                    causes_supported: [])
  end

  def set_investor
     @investor = Investor.find(params[:id])
  end
end
