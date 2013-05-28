class MyDocument < Prawn::Document
    def initialize(opening, view)
      super(top_margin: 36, left_margin: 26, right_margin: 26, keywords: "Sam Walton Rails developer",
      	    creator: "samwalton.me", CreationDate: "#{Time.now}")
      #encoding: utf-8
      @opening = opening
      @view = view
      font_families.update("Nunito" => {
      	:normal => Dir.pwd + "/app/assets/stylesheets/Nunito-Regular.ttf",
      	:bold => Dir.pwd + "/app/assets/stylesheets/Nunito-Bold.ttf",
      	:light => Dir.pwd + "/app/assets/stylesheets/Nunito-Light.ttf"
      })
      font "Nunito"
      text "Sam Walton", style: :bold, leading: -1
      text "7540 Harper Rd", leading: -1
      text "Joelton, TN 37080, near Nashville, TN", leading: -1
      text "615-495-7783 \u2022 sam@samwalton.me", leading: -1

	bounding_box([350, 674], width: 72) do
	  text "<color rgb='cb2e03'><u><link href='http://www.linkedin.com/in/samwalton0'>Linkedin</link></u></color>", :inline_format => true
  end
  bounding_box([418, 674], width: 72) do
  	text "<color rgb='cb2e03'><u><link href='https://github.com/sam452'>Github</link></u></color>", :inline_format => true
  end
      image "#{Dir.pwd + '/app/assets/images/linkedin.png'}", at: [350, 720]
      image "#{Dir.pwd + '/app/assets/images/github_logo.png'}", at: [415, 720]
      move_down 6
      subhed "Experience"
move_up 12

 			#my_skills = [["\u2022 Cucumber, Rspec and unit test-driven development", "\u2022 Written several Applescript applets for automation"], ["\u2022 Ruby on Rails, Ruby", "\u2022 Set up several servers at work, home"], ["\u2022 Javascript, CSS, HTML5", "\u2022 Translating team requirements for quality, throughput"], ["\u2022 Wordpress theme creation", "\u2022 Extensive management experience"], ["\u2022 Subject-matter expert on Adobe CS print apps", "\u2022 Comfortable speaking before groups"], ["\u2022 Filemaker Pro, other SQL experience"]]
 
      current
      tight_right "Grizzard Inc., Atlanta, Ga."
      base @opening.grizzard
      tight_right "Panaprint, Inc., Macon, Ga."
      base "Composition Department manager from <b>January 1994 to January 1995</b>. Eliminated bottlenecks and help the team to use untapped capabilities in the new systems. The goal was achieved when productivity increased by 25 percent and meeting 95 per cent of the deadlines."
      subhed "Skills"
 			#table(my_skills, column_widths: [270, 270], cell_style: {padding: [0, 3, 0, 0], borders: []})
      column_box([0, cursor], columns: 2, width: bounds.width, height: 115) do
      	text("\u2022 Cucumber, Rspec and unit test-driven development \n\u2022 Ruby on Rails, Ruby\n\u2022 Javascript, CSS, HTML5\n\u2022 Wordpress theme creation\n\u2022 Subject-matter expert on Adobe CS print apps\n\u2022 Filemaker Pro, other SQL experience\n\u2022 Written several Applescript applets for automation\n\u2022 Set up several servers at work, home\n\u2022 Translating team requirements for quality, throughput\n\u2022 Extensive management experience\n\u2022 Comfortable speaking before groups")
      end
      subhed "Education"
      text "\u2022 Nashville Software School, 2012."
      text "\u2022 Pragmatic Studio for Ruby on Rails, January 2009."
      text "\u2022 Graduated June 1985 from Henry W. Grady School of Journalism and Mass Communications, University of Georgia, with a major in newspapers and a minor in Religion."
 #text sprintf("€ %6.2f", amount)

   end

    protected

    def current
    	if @opening.current?
    		self.tight_right "Current"
    		self.base "#{@opening.current}"
    	end
    end	

    def subhed(title)
    	self.move_down 6
    	self.text title, style: :bold, align: :center
    	#self.move_down 3
    end

    def tight_right(text)
    	self.move_down 6
    	self.text text, style: :bold
    	self.move_down 3
    end

    def base(text)
    	self.indent(12) do 
    		self.text text, style: :normal, inline_format: true, leading: -1
    	end
    end

    def bullet
    	self.text ".", style: :bold, size: 72
    end

    def embolden(text)
    	self.text text, inline_format: true
    end


end