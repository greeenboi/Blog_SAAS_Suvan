module ApplicationHelper
  include Pagy::Frontend
  require 'pagy/extras/overflow'
  Pagy::DEFAULT[:overflow] = :last_page
  Pagy::DEFAULT[:items] = 14 # items per page
  Pagy::DEFAULT[:size]  = 9 # page size
end
