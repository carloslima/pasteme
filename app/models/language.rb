class Language < ActiveRecord::Base
  has_many :snippets
  
  validates_presence_of :name, :parser
end
