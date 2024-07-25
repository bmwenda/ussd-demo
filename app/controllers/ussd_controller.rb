class UssdController < ApplicationController
  class InvalidMenuOption < StandardError;

  end
  def callback
    menu_option = ussd_params[:text]
    result = response_text(menu_option)
    render plain: result, status: :ok
  rescue InvalidMenuOption => e
    Rails.logger.error e.to_s
    render plain: "END The menu option #{menu_option} is not valid", status: :bad_request
  end

  private

  def ussd_params
    params.permit(:phoneNumber, :serviceCode, :text, :sessionId, :networkCode)
  end

  def response_text(menu_option)
    Rails.logger.info "Evaluating menu option: --#{menu_option}--"
    case menu_option
    when '' || nil
      welcome_menu
    when '1'
      account_menu
    when '2'
      phone_number
    when '1*1'
      account_number
    when '1*2'
      account_balance
    else
      raise InvalidMenuOption.new "Invalid menu option: #{menu_option}"
    end
  end

  def welcome_menu
    <<~TEXT
      CON What would you want to check? \n
      1. My Account
      2. My phone number
    TEXT
  end

  def account_menu
    <<~TEXT
      CON Choose account information you want to view \n
      1. Account number
      2. Account balance
    TEXT
  end

  def phone_number
    "END Your phone number is 254 000 000"
  end

  def account_number
    'END your account number is BIC1111987654'
  end

  def account_balance
    'END your balance is KES 24,000'
  end
end
