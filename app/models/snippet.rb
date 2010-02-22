class Snippet < ActiveRecord::Base
  belongs_to :language

  validates_presence_of :language_id, :language
  validates_associated :language
  validates_presence_of :code

  @@no_line_numbers = false
  @@defaut_theme = 'slush_poppies'
  @@per_page = 10
  cattr_reader :per_page

  def formatted_code
    Uv.parse(code_with_trailing_space, 'xhtml', language.parser, @@no_line_numbers, @@defaut_theme)
  end

  def formatted_line_numbering
    Range.new(1,code.to_a.size).map{|line_number| line_number.to_s.rjust(4)}.join("&#x000A;")
  end
  
  def preview
    unless @preview
      @preview = clone
      @preview.code = code.to_a.first(3).to_s
    end
    @preview
  end

  def to_json(options = nil)
    options ||= {:only=>[:id,:code,:updated_at], :include => {:language => {:only => :name }}}
    super(options)
  end

  private

  # <pre> blocks wont show the last line if it's empty, making the
  # line numbering and code block get out of sync (one extra line number)
  # So, if the code has an "empty" line at the end, we add a space to it
  # to make sure it displays correctly.
  def code_with_trailing_space
    code.chomp+" "
  end
end
