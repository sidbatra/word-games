class Query < ActiveRecord::Base
  attr_accessible :ip, :operation, :text
end
