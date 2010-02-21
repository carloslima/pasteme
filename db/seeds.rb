# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Generate a more human-looking name from the parser name
def parser_to_name(parser_name)
  parser_name.split("_").map(&:capitalize).join(" ")
end

#Only load if the db is empty
unless Language.first
  #Load those first so they automatically go at the top of the listing
  Language.create :name=>"Ruby On Rails", :parser=>"ruby_on_rails"
  Language.create :name=>"Ruby", :parser=>"ruby"
  Language.create :name=>"Javascript", :parser=>"javascript"
  Language.create :name=>"PHP", :parser=>"php"
  Language.create :name=>"Perl", :parser=>"perl"
  Language.create :name=>"Plaintext", :parser=>"plain_text"

  #Then load all the others
  languages = Uv.syntaxes-['ruby_on_rails','ruby','javascript','php','perl','plain_text']
  languages.sort.each{|lang|
      Language.create :parser=>lang, :name=>parser_to_name(lang)
  }

  #And load some sample snippets
  File.read("db/seeds/snippets.txt").split("----\n").map{|sample|
    sample = sample.to_a
    parser = sample.shift.chomp
    code = sample.to_s
    Snippet.create :language=>Language.find_by_parser(parser), :code=>code
  }
else
  raise "Database is not empty. Seed failed."
end
