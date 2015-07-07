class SessionsController < Devise::SessionsController
  layout 'session'
  skip_before_filter :require_no_authentication, :only => [:new]  

  def create
    if verify_recaptcha(:message => "Captcha incorreto.")
      super
    else
      build_resource
      respond_with_navigational(resource) { render :new }
    end    
  end

  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
  end

end