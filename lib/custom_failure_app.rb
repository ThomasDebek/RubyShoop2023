class CustomFailureApp < Devise::FailureApp

  def route(*)
    :root_url
  end
end