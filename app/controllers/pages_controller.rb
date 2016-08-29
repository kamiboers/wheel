class PagesController < ApplicationController

def home
  redirect_to '/dashboard' if current_user
end

end