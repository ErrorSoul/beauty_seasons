class LinksController < ApplicationController
  layout 'session'

  def new
    create_customer unless find_customer

  end

  def show
    unless find_customer
      redirect_to redirect_to new_link_path and return
    end
    @customer = find_customer
    unless @customer.tasks.present?
      @report = Report.first
      @task = Task.find_by(id: @report.current_id)
      unless @task
        flash[:success] = 'К сожалению, заданий больше нет'
        redirect_to redirect_to new_link_path and return
      end
      @customer.tasks << @task
      @task.used
      @report.update_attribute :current_id, (@report.current_id + 1)
    end
  end

  private

  def find_customer
    @customer = Customer.find_by(remember_token: get_cookies) || Customer.find_by(ip_address: request.remote_ip)
  end

  def create_customer
    set_cookies
    Customer.create(remember_token: get_cookies, ip_address: request.remote_ip)
  end


  def set_cookies
    cookies.permanent[:remember_token_link] ||= create_remember_token
  end

  def get_cookies
    cookies.permanent[:remember_token_link]
  end

  def without_cookies?
    cookies.permanent[:remember_token_link].nil?
  end


  def new_remember_token
    SecureRandom.urlsafe_base64
  end

  def token_encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def create_remember_token
    token_encrypt new_remember_token
  end
end
