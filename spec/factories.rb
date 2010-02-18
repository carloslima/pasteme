Factory.define :snippet do |f|
  f.code "<?php die('hard'); ?>"
  f.association :language
  end

Factory.define :language do |f|
  f.name "Luby on Lails"
  f.parser "xuby_on_xails" 
end