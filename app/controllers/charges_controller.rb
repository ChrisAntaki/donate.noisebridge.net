class ChargesController < DonationsController

  before_filter :find_or_create_donor

  def create
    # HACK TODO: fix the dollars / cents thing
    @charge = @donor.charges.new({
      amount: charge_params[:amount].to_i * 100
    })

    if @charge.save
      redirect_to(thanks_path)
    else
      flash[:danger] = @charge.errors.full_messages
      redirect_to root_url
    end
  end
end
