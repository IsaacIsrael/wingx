class CompaniesController < ApplicationController
  def new
    @companies = Company.new
  end

  def create
    @user = User.find(params[:user_id])
    @company = Company.new(company_params)
    @company.user = @user
    if @company.save
      redirect_to @company
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company.update(company_params)
    redirect_to @company
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to @companies
  end

  private

  def company_params
    params.require(:company).permit(:name, :cnpj, :image_url, :user_id)
  end
end
