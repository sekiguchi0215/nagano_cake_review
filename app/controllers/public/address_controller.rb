class Public::AddressController < ApplicationController
	before_action :acthenticate_customer!
	before_action :ensure_address, only: [:edit, :update, :destroy]

	def index
		@addresses = current_customer.addresses # 複数の住所を登録できるため全ての住所を表示
		@address = Address = Address.new
	end

	def create
		@addresses = current_customer.addresses
		@address = Address.new(address_params)
		@address.customer_id = current_cutomer.id
		@address.save ? (redirect_to addresses_path) : (render :index)
	end

	def edit
	end

	def update
		@address.update(address_params) ? (redirect_to addresses_path) : (render :edit)
	end

	def destroy
		@address.destroy
		redirect_to addresses_path
	end

	private

	def ensure_address
		@addresses = current_customer.addresses
		@address = @addresses.find_by(id: params[:id]) #
		redirect_to addresses_path unless @address     #
	end

	def address_params
		params.require(:address).permit(:postal_code, :destination, :name)
	end
end
