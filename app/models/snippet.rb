class Snippet < ActiveRecord::Base
  belongs_to :language

  validates_presence_of :language_id, :language
  validates_associated :language
  validates_presence_of :code

end
