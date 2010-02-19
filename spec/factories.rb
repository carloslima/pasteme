Factory.define :snippet do |f|
  f.code "quit('smoking')"
  f.association :language
  end

Factory.define :language do |f|
  f.name "Ruby"
  f.parser "ruby" 
end