class Snippet < ActiveRecord::Base
  belongs_to :language

  validates_presence_of :language_id, :language
  validates_associated :language
  validates_presence_of :code

  def formatted_code
    Uv.parse(code, 'xhtml', language.parser, false, 'slush_poppies')
  end
  def formatted_line_numbering
    Range.new(1,code.to_a.size).map{|line_number| line_number.to_s.rjust(4)+"&#x000A;"}
  end
  def preview
    unless @preview
      @preview = clone
      @preview.code = code.to_a.first(3).to_s
    end
    @preview
  end
end
